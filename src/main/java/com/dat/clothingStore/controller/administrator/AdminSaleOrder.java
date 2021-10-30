package com.dat.clothingStore.controller.administrator;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dat.clothingStore.controller.BaseController;
import com.dat.clothingStore.dto.Order;
import com.dat.clothingStore.entities.Products;
import com.dat.clothingStore.entities.Roles;
import com.dat.clothingStore.entities.SaleOrder;
import com.dat.clothingStore.entities.SaleOrderProduct;
import com.dat.clothingStore.services.ProductService;
import com.dat.clothingStore.services.RoleService;
import com.dat.clothingStore.services.SaleOrderProductService;
import com.dat.clothingStore.services.SaleOrderService;

@Controller
public class AdminSaleOrder extends BaseController{
	
	@Autowired
	SaleOrderService saleorderService;
	
	@Autowired
	SaleOrderProductService saleorderProductService;
	
	@Autowired
	ProductService productService;
	
	@RequestMapping(value = {"/admin/saleorder"}, method = RequestMethod.GET)
	public String saleorder(final Model model) {
		String sql = "SELECT * FROM shop.tbl_saleorder order by created_date desc;";
		List<SaleOrder> saleorders = saleorderService.runTransactQuerySQL(sql, 0).getData();
		model.addAttribute("saleorder", saleorders);
		return "administrator/saleorder";
	}
	
	@RequestMapping(value = {"/admin/ajax/detailSaleOrder/{saleorderId}"}, method = RequestMethod.POST)
	public ResponseEntity<List<Order>> ajax_detailSaleOrder(final Model model,
			@PathVariable("saleorderId") int id){
		String sql = "SELECT * FROM shop.tbl_saleorder_products where saleorder_id = " + id;
		List<SaleOrderProduct> saleorderProducts = saleorderProductService.runTransactQuerySQL(sql, 0).getData();
		
		
		List<Order> jsonResult = new ArrayList<Order>();
		for (SaleOrderProduct s : saleorderProducts) {
			Order order = new Order();
			order.setName(s.getProduct().getTitle());
			order.setPrice(s.getProduct().getPrice().doubleValue());
			order.setQuantity(s.getQuantity());
			order.setPath(s.getProduct().getAvatar());
			jsonResult.add(order);
		}
		
		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = {"/admin/ajax/saleorder/deleteSaleOrder/{saleorderId}"}, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteSaleOrder(final Model model,
					@PathVariable("saleorderId") int saleorderId
					){
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("saleorderId", saleorderId);
		SaleOrder saleorder = saleorderService.getById(saleorderId);
		saleorder.setStatus(false);
		return ResponseEntity.ok(jsonResult);
	}
}
