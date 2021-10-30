package com.dat.clothingStore.controller.customer;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dat.clothingStore.controller.BaseController;
import com.dat.clothingStore.dto.Cart;
import com.dat.clothingStore.dto.CartItem;
import com.dat.clothingStore.entities.SaleOrder;
import com.dat.clothingStore.entities.SaleOrderProduct;
import com.dat.clothingStore.services.ProductService;
import com.dat.clothingStore.services.SaleOrderService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CartController extends BaseController {
	
	@Autowired 
	SaleOrderService saleOrderService;
	
	@Autowired
	ProductService productService;
	
	@RequestMapping(value = {"/cart"}, method = RequestMethod.GET)
	public String cart(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response) throws IOException{
		return "customer/cart";
	}
	
	@RequestMapping(value = { "/ajax/deleteCart" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_deleteCart(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody CartItem cartItem) {

		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng.
		Cart cart = null;
		cart = (Cart) session.getAttribute("cart");

		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		for (CartItem item : cartItems) {
			if (item.getProductId() == cartItem.getProductId()) {
				cart.getCartItems().remove(item);
				break;
			}
		}
		session.setAttribute("cart", cart);
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("totalItems", getTotalItems(request));
		
		session.setAttribute("totalItems", getTotalItems(request));

		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = { "/ajax/changeQuantity" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_changeQuantity(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody CartItem cartItem) {

		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng.
		Cart cart = null;
		cart = (Cart) session.getAttribute("cart");

		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();
		for (CartItem item : cartItems) {
			if(item.getProductId() == cartItem.getProductId()) {
				item.setQuantity(cartItem.getQuantity());
				session.setAttribute("totalItems", getTotalItems(request));
				break;
			}
		}
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("totalItems", getTotalItems(request));
		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = {"/cart/checkout"}, method = RequestMethod.GET)
	public String get_checkout(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession();
		Cart cart = null;
		cart = (Cart) session.getAttribute("cart");
		if(cart != null) {
			BigDecimal total = BigDecimal.ZERO;
			List<CartItem> cartItems = cart.getCartItems();
			
			for (CartItem item : cartItems) {
				BigDecimal subTotal = BigDecimal.ZERO;
				subTotal = item.getPriceUnit().multiply(BigDecimal.valueOf(item.getQuantity()));
				total = total.add(subTotal);
			}
			cart.setTotalPrice(total);
			session.setAttribute("totalPrice", cart.getTotalPrice());
		}
		else {
			session.setAttribute("totalPrice", 0);
		}
		return "customer/checkout";
	}
	
	@RequestMapping(value = {"/cart/checkout"}, method = RequestMethod.POST)
	public String post_checkout(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response) throws IOException{
		
		String customerFullname = request.getParameter("fullname");
		String customerEmail = request.getParameter("email");
		String customerPhoneNumber = request.getParameter("phonenumber");
		String customerAddress = request.getParameter("address");
		
		SaleOrder saleorder = new SaleOrder();
		saleorder.setCustomerName(customerFullname);
		saleorder.setCustomerEmail(customerEmail);
		saleorder.setCustomerPhone(customerPhoneNumber);
		saleorder.setCustomerAddress(customerAddress);
		HttpSession session = request.getSession();
		Cart cart = null;
		cart = (Cart) session.getAttribute("cart");
		for (CartItem item : cart.getCartItems()) {
			SaleOrderProduct saleorderProduct = new SaleOrderProduct();
			saleorderProduct.setProduct(productService.getById(item.getProductId()));
			saleorderProduct.setQuantity(item.getQuantity());
			saleorder.setTotal(cart.getTotalPrice());
			saleorder.addSaleOrderProduct(saleorderProduct);
		}
		saleorder.setCreatedDate(new Date());
		saleOrderService.saveOrUpdate(saleorder);
		session.setAttribute("cart", null);
		session.setAttribute("totalItems", 0);
		session.setAttribute("totalPrice", 0);
		return "redirect:/home";
	}
}
