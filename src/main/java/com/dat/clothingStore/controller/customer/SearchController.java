package com.dat.clothingStore.controller.customer;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dat.clothingStore.dto.ProductSearchData;
import com.dat.clothingStore.dto.ProductSearchModel;
import com.dat.clothingStore.entities.Products;
import com.dat.clothingStore.services.ProductService;

@Controller
public class SearchController {
	
	@Autowired ProductService productService;
	
	@RequestMapping(value = {"/ajax/search/{key}"}, method = RequestMethod.POST)
	public ResponseEntity<List<ProductSearchData>> ajax_search(Model model, @PathVariable("key") String key){
		List<ProductSearchData> jsonResult = new ArrayList<ProductSearchData>();
		if(key != null) {
			ProductSearchModel searchModel = new ProductSearchModel();
			searchModel.setKeyword(key);
			List<Products> products = productService.search(searchModel).getData();
			for(Products p : products) {
				ProductSearchData data = new ProductSearchData();
				data.setSeo(p.getSeo());
				data.setTitle(p.getTitle());
				data.setPath(p.getAvatar());
				data.setPrice(p.getPrice().doubleValue());
				jsonResult.add(data);
			}
		}
		
		
		return ResponseEntity.ok(jsonResult);
	}
	
	
}
