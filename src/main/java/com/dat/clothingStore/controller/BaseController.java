package com.dat.clothingStore.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.dat.clothingStore.dto.Cart;
import com.dat.clothingStore.dto.CartItem;
import com.dat.clothingStore.entities.Categories;
import com.dat.clothingStore.entities.Roles;
import com.dat.clothingStore.entities.SaleOrderProduct;
import com.dat.clothingStore.entities.Users;
import com.dat.clothingStore.services.CategoryService;
import com.dat.clothingStore.services.RoleService;
import com.dat.clothingStore.services.SaleOrderProductService;
import com.dat.clothingStore.services.UserService;

public abstract class BaseController {
	
	@Autowired
	CategoryService categoryService;
	
	@ModelAttribute("categories")
	public List<Categories> categories(){
		return categoryService.findAll();
	}
	
	@Autowired 
	RoleService roleService;
	@ModelAttribute("roles")
	public List<Roles> roles(){
		return roleService.findAll();
	}
	
	@Autowired
	SaleOrderProductService saleorderProductService;
	@ModelAttribute("detail")
	public List<SaleOrderProduct> saleorderProducts(){
		return saleorderProductService.findAll();
	}
	
	public int getCurrentPage(HttpServletRequest request) {
		try {
			return Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			return 1;
		}
	}
	
	@ModelAttribute("userLogined")
	public Users getLogined() {
		Object userLogined = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(userLogined != null && userLogined instanceof UserDetails)
			return (Users) userLogined;
		return null;
	}
	
	public int getTotalItems(final HttpServletRequest request) {
		HttpSession httpSession = request.getSession();

		if (httpSession.getAttribute("cart") == null) {
			return 0;
		}

		Cart cart = (Cart) httpSession.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();

		int total = 0;
		for (CartItem item : cartItems) {
			total += item.getQuantity();
		}

		return total;
	}
	
}