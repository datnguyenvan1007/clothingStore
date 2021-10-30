package com.dat.clothingStore.controller.customer;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dat.clothingStore.controller.BaseController;
import com.dat.clothingStore.controller.EmailController;
import com.dat.clothingStore.entities.Contact;
import com.dat.clothingStore.services.ContactService;

@Controller
public class ContactController extends EmailController{
	
	@Autowired ContactService contactService;
	
	@RequestMapping(value = {"/ajax/contact"}, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> contact(final Model model,
					@RequestBody Contact contact){
		contact.setCreatedDate(new Date());
		contactService.saveOrUpdate(contact);
		sendEmail(contact.getEmail());
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		return ResponseEntity.ok(jsonResult);
	}
}
