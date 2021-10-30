package com.dat.clothingStore.controller.customer;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dat.clothingStore.controller.BaseController;
import com.dat.clothingStore.dto.Cart;
import com.dat.clothingStore.dto.CartItem;
import com.dat.clothingStore.dto.CategorySearchModel;
import com.dat.clothingStore.dto.ProductSearchModel;
import com.dat.clothingStore.entities.Categories;
import com.dat.clothingStore.entities.Products;
import com.dat.clothingStore.services.CategoryService;
import com.dat.clothingStore.services.PagerData;
import com.dat.clothingStore.services.ProductService;

@Controller
public class HomeController extends BaseController{
	
	@Autowired ProductService productService;
	
	@Autowired CategoryService categoryService;
	
	@RequestMapping(value = {"/home"}, method = RequestMethod.GET)
	public String home(final Model model, 
			final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		List<Products> product = productService.findAll();
		model.addAttribute("product", product);
		HttpSession session = request.getSession();
		session.setAttribute("totalItems", getTotalItems(request));
		return "customer/home";
	}
	
	@RequestMapping(value = {"/category/{seo}"}, method = RequestMethod.GET)
	public String category(final Model model, 
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("seo") String seo) throws IOException {
		CategorySearchModel searchCategory = new CategorySearchModel();
		searchCategory.setSeo(seo);
		
		List<Categories> categories = categoryService.search(searchCategory).getData();
		ProductSearchModel searchProduct = new ProductSearchModel();
		for (Categories category : categories) {
			if(category.getSeo().equals(seo)) {
				searchProduct.setCategoryId(category.getId());
			}
		}
		if(seo.equals("san-pham-moi")) {
			searchProduct.setIsHotNew(2);
		}
		else if(seo.equals("san-pham-ban-chay")) {
			searchProduct.setIsHotNew(1);
		}
		searchProduct.setPage(getCurrentPage(request));
		model.addAttribute("products", productService.search(searchProduct));
		model.addAttribute("seo", seo);
		return "customer/category";
	}
	
	@RequestMapping(value = { "/ajax/cart" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_AddToCart(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody CartItem cartItem) {

		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng.
		Cart cart = null;
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		// kiểm tra nếu có trong giỏ hàng thì tăng số lượng
		boolean isExists = false;
		for (CartItem item : cartItems) {
			if (item.getProductId() == cartItem.getProductId()) {
				isExists = true;
				item.setQuantity(item.getQuantity() + cartItem.getQuantity());
			}
		}

		// nếu sản phẩm chưa có trong giỏ hàng
		if (!isExists) {
			Products productInDb = productService.getById(cartItem.getProductId());

			cartItem.setProductName(productInDb.getTitle());
			cartItem.setPriceUnit(productInDb.getPrice());
			cartItem.setPath(productInDb.getAvatar());
			cart.getCartItems().add(cartItem);
		}

		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("totalItems", getTotalItems(request));
		
		session.setAttribute("totalItems", getTotalItems(request));

		return ResponseEntity.ok(jsonResult);
	}

}
