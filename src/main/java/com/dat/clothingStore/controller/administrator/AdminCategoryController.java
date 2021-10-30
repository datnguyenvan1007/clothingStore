package com.dat.clothingStore.controller.administrator;

import java.io.IOException;
import java.util.HashMap;
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
import com.dat.clothingStore.dto.CategorySearchModel;
import com.dat.clothingStore.entities.Categories;
import com.dat.clothingStore.services.CategoryService;

@Controller
public class AdminCategoryController extends BaseController{
	@Autowired CategoryService categoryService;
	
	@RequestMapping(value = "/admin/category", method = RequestMethod.GET)
	public String category(final Model model, final HttpServletRequest request) throws IOException{
		
		CategorySearchModel searchModel = new CategorySearchModel();
		searchModel.setKeyword(request.getParameter("keyword"));
		model.addAttribute("categoryWithPaging", categoryService.search(searchModel));
		model.addAttribute("searchModel", searchModel);
		return "administrator/category";
	}
	
	@RequestMapping(value = "/admin/category/addOrUpdateCategory/{categoryId}", method = RequestMethod.GET)
	public String updateCategory(final Model model, 
								@PathVariable("categoryId") int categoryId) throws IOException{
		Categories category = new Categories();
		category = categoryService.getById(categoryId);
		model.addAttribute("category", category);
		return "administrator/addOrUpdateCategory";
	}
	
	@RequestMapping(value = "/admin/category/addOrUpdateCategory", method = RequestMethod.GET)
	public String get_addCategory(final Model model) throws IOException{
		model.addAttribute("category", new Categories());
		return "administrator/addOrUpdateCategory";
	}
	
	@RequestMapping(value = "/admin/category/addOrUpdateCategory", method = RequestMethod.POST)
	public String post_addCategory(final Model model, 
									@ModelAttribute("category") Categories cate) throws IOException{
		Categories category = new Categories();
		category = categoryService.getByTransactQuerySQL("select * from tbl_category where name = '" + cate.getName() + "'");
		if(category.getId() == null || category.getId() <= 0) {
			cate.setSeo(Utilities.slugify(cate.getName()));
			categoryService.saveOrUpdate(cate);
		}
		else {
			category.setStatus(cate.getStatus());
			categoryService.saveOrUpdate(category);
		}
		return "administrator/addOrUpdateCategory";
	}
	
	@RequestMapping(value = "/admin/ajax/category/deleteCategory/{categoryId}", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteCategory(@PathVariable("categoryId") int id){
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("categoryId", id);
		Categories category = categoryService.getById(id);
		category.setStatus(false);
		categoryService.saveOrUpdate(category);
		return ResponseEntity.ok(jsonResult);
	}
}
