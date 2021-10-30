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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dat.clothingStore.components.Utilities;
import com.dat.clothingStore.controller.BaseController;
import com.dat.clothingStore.dto.ProductSearchModel;
import com.dat.clothingStore.entities.Products;
import com.dat.clothingStore.services.ProductService;

@Controller
public class AdminProductController extends BaseController {
	@Autowired
	private ProductService productService;
	
	
	@RequestMapping(value = "/admin/product", method = RequestMethod.GET)
	public String product(final Model model, final HttpServletRequest request) throws IOException{
		
//		List<Products> products = productService.findAll();
//		model.addAttribute("products", products);
		
		ProductSearchModel searchModel = new ProductSearchModel();
		searchModel.setKeyword(request.getParameter("keyword"));
		searchModel.setPage(getCurrentPage(request));
		model.addAttribute("productWithPaging", productService.search(searchModel));
		model.addAttribute("searchModel", searchModel);
		return "administrator/product";
	}
	
	
	
	@RequestMapping(value = "/admin/product/addOrUpdateProduct", method = RequestMethod.GET)
	public String addProduct_get(final Model model) throws Exception{
		model.addAttribute("addProduct", new Products());
		return "administrator/addOrUpdateProduct";
	}
	
	@RequestMapping(value = "/admin/product/addOrUpdateProduct/{productId}", method = RequestMethod.GET)
	public String addOrUpdateProduct(final Model model, 
									@PathVariable("productId") int productId) throws Exception{
		
		Products product = productService.getById(productId);
		model.addAttribute("addProduct", product);
		return "administrator/addOrUpdateProduct";
	}
	
	@RequestMapping(value = "/admin/product/addOrUpdateProduct", method = RequestMethod.POST)
	public String addProduct_post(final Model model,
								@ModelAttribute("addProduct") Products product,
								@RequestParam("productAvatar") MultipartFile productAvatar, // hứng file đẩy lên
								@RequestParam("productPictures") MultipartFile[] productPictures) throws Exception{
		
		if(product.getId() == null || product.getId() <= 0) {
			product.setSeo(Utilities.slugify(product.getTitle()));
			productService.add(product, productAvatar, productPictures);
		}
		else {
			product.setSeo(Utilities.slugify(product.getTitle()));
			productService.update(product, productAvatar, productPictures);
		}
		return "administrator/addOrUpdateProduct";
	}
	
	@RequestMapping(value = {"/admin/ajax/product/deleteProduct/{productId}"}, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteProduct(final Model model,
					@PathVariable("productId") int productId
					){
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("productId", productId);
		Products product = productService.getById(productId);
		product.setStatus(false);
		productService.saveOrUpdate(product);
		return ResponseEntity.ok(jsonResult);
	}
}
