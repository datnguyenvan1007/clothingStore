package com.dat.clothingStore.controller.administrator;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dat.clothingStore.components.Utilities;
import com.dat.clothingStore.controller.BaseController;
import com.dat.clothingStore.entities.Products;
import com.dat.clothingStore.entities.Roles;
import com.dat.clothingStore.entities.Users;
import com.dat.clothingStore.services.RoleService;
import com.dat.clothingStore.services.UserService;

@Controller
public class AdminAccountController extends BaseController{
	
	@Autowired UserService userService;
	
	@Autowired RoleService roleService;
	
	@RequestMapping(value = "/admin/account/addAccount", method = RequestMethod.GET)
	public String addAccount(final Model model) throws IOException{
		model.addAttribute("account", new Users());
		return "administrator/add_account";
	}
	
	@RequestMapping(value = "/admin/account/customerAccount", method = RequestMethod.GET)
	public String customerAccount(final Model model) throws IOException{
		Roles role = roleService.getByTransactQuerySQL("select * from shop.tbl_roles where name = 'Khách hàng'");
		List<Users> users = userService.search(null, role).getData();
		model.addAttribute("users", users);
		model.addAttribute("roleId", role.getId());
		return "administrator/customer_account";
	}
	
	@RequestMapping(value = "/admin/account/staffAccount", method = RequestMethod.GET)
	public String staffAccount(final Model model) throws IOException{
		Roles role = roleService.getByTransactQuerySQL("select * from shop.tbl_roles where name = 'Nhân viên'");
		List<Users> users = userService.search(null, role).getData();
		model.addAttribute("users", users);
		model.addAttribute("roleId", role.getId());
		return "administrator/staff_account";
	}
	
	@RequestMapping(value = "/admin/account/addAccount", method = RequestMethod.POST)
	public String addAccountPost(final Model model, HttpServletRequest request, @ModelAttribute("account") Users user) throws IOException{
		int r = Integer.parseInt(request.getParameter("role"));
		Roles role = roleService.getById(r);
		user.addRole(role);
		user.setPassword(Utilities.encode(user.getPassword()));
		userService.saveOrUpdate(user);
		return "administrator/add_account";
	}
	
	@RequestMapping(value = "/admin/account/addAccount/{accountId}/{roleId}", method = RequestMethod.GET)
	public String updateAccountPost(final Model model, HttpServletRequest request,
			@PathVariable("accountId") int accId,
			@PathVariable("roleId") int roleId) throws IOException{
		Users u = userService.getById(accId);
		model.addAttribute("account", u);
		model.addAttribute("role", roleId);
		
		return "administrator/add_account";
	}
	
	@RequestMapping(value = {"/admin/ajax/account/deleteAccount/{accountId}/{roleId}"}, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteAccount(final Model model,
					@PathVariable("accountId") int accountId,
					@PathVariable("roleId") int roleId
					){
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("accountId", accountId);
		Roles role = roleService.getById(roleId);
		Users user = userService.getById(accountId);
		user.deleteRole(role);
		userService.delete(user);
		return ResponseEntity.ok(jsonResult);
	}
}
