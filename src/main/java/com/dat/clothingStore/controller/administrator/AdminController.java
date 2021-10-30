package com.dat.clothingStore.controller.administrator;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dat.clothingStore.controller.BaseController;

@Controller
public class AdminController extends BaseController{
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin() throws IOException{
		
		return "administrator/admin";
	}
}
