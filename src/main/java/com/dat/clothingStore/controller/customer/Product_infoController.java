package com.dat.clothingStore.controller.customer;


import com.dat.clothingStore.controller.BaseController;
import com.dat.clothingStore.dto.ProductSearchModel;
import com.dat.clothingStore.entities.Categories;
import com.dat.clothingStore.entities.Products;
import com.dat.clothingStore.entities.ProductImages;
import com.dat.clothingStore.services.CategoryService;
import com.dat.clothingStore.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;
import java.util.Set;

@Controller
public class Product_infoController extends BaseController {
	
    @Autowired
    ProductService productService;

	@RequestMapping(value = "/product_info/{seo}", method = RequestMethod.GET)
	public String product_info(final Model model,
							   @PathVariable("seo") String seo) throws Exception{
		ProductSearchModel searchModel = new ProductSearchModel();
		searchModel.setSeo(seo);
		List<Products> listProduct = productService.search(searchModel).getData();
		for (Products product : listProduct) {
			if(product.getSeo().equals(seo)) {
				Categories category = product.getCategories();
				model.addAttribute("category", category);
				model.addAttribute("product", product);
				Set<ProductImages> productsImages = product.getProductImages();
				model.addAttribute("pictures", productsImages);
				break;
			}
		}
		return "customer/product_info";
	}
}
