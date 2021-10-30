package com.dat.clothingStore.controller.customer;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.dat.clothingStore.components.Utilities;
import com.dat.clothingStore.controller.BaseController;
import com.dat.clothingStore.entities.Contact;
import com.dat.clothingStore.entities.Roles;
import com.dat.clothingStore.entities.Users;
import com.dat.clothingStore.services.RoleService;
import com.dat.clothingStore.services.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginCotroller  {
	
	@Autowired
	RoleService roleService;
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(final Model model) throws IOException{
		model.addAttribute("name", "Đăng nhập");
		return "customer/login";
	}
	
	@RequestMapping(value = "/forgot_password", method = RequestMethod.GET)
	public String forgot_password(final Model model) throws IOException{
		model.addAttribute("name", "Quên mật khẩu");
		
		return "customer/forgot_password";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(final Model model) throws IOException{
		model.addAttribute("name", "Đăng ký");
		return "customer/register";
	}
	
	@RequestMapping(value = {"/ajax/register"}, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_register(final Model model,
					@RequestBody Users user){
		Roles role = roleService.getByTransactQuerySQL("SELECT * FROM shop.tbl_roles r where r.name = 'Khách hàng'");
		user.addRole(role);
		user.setPassword(Utilities.encode(user.getPassword()));
		userService.saveOrUpdate(user);
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		return ResponseEntity.ok(jsonResult);
	}
	
//	@RequestMapping(value = "/register", method = RequestMethod.POST)
//	public String post_register(final Model model, @ModelAttribute("register") Users user) throws IOException{
//		Roles role = roleService.getByTransactQuerySQL("SELECT * FROM shop.tbl_roles r where r.name = 'Khách hàng'");
//		user.addRole(role);
//		user.setPassword(Utilities.encode(user.getPassword()));
//		userService.saveOrUpdate(user);
//		return "customer/register";
//	}
	
}
