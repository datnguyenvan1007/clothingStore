package com.dat.clothingStore.controller.administrator;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dat.clothingStore.controller.BaseController;
import com.dat.clothingStore.entities.Contact;
import com.dat.clothingStore.services.ContactService;

@Controller
public class AdminContactController extends BaseController{
	
	@Autowired
	ContactService contactService;
	
	@RequestMapping(value = "/admin/contact", method = RequestMethod.GET)
	public String get_contact(final Model model) {
		String sql = "SELECT * FROM shop.tbl_contact order by created_date desc;";
		List<Contact> contact = contactService.runTransactQuerySQL(sql, 0).getData();
		model.addAttribute("contact", contact);
		return "administrator/contact";
	}
	
	@RequestMapping(value = {"/admin/ajax/contact/deleteContact/{contactId}"}, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteSaleOrder(final Model model,
					@PathVariable("contactId") int contactId
					){
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("contactId", contactId);
		contactService.deleteById(contactId);
		return ResponseEntity.ok(jsonResult);
	}
}
