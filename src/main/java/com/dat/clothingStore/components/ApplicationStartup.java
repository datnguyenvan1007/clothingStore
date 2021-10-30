//package com.dat.clothingStore.components;
//
//import java.math.BigDecimal;
//import java.util.Date;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.context.event.ApplicationReadyEvent;
//import org.springframework.context.ApplicationListener;
//import org.springframework.stereotype.Component;
//
//import com.dat.clothingStore.entities.Categories;
//import com.dat.clothingStore.entities.Products;
//import com.dat.clothingStore.services.CategoryService;
//
//@Component // bean
//public class ApplicationStartup implements ApplicationListener<ApplicationReadyEvent> {
//
//	@Autowired // inject 1 bean vào trong 1 bean khác
//	private CategoryService categoryService;
//	
//	/**
//	 * khi ứng dụng chạy xong sẽ chạy vào hàm này.
//	 */
//	@Override
//	public void onApplicationEvent(final ApplicationReadyEvent event) {
//		this.seedCategory();
//		
//	}
//	
//	private void seedCategory() {
//		
//		Categories cateJava = categoryService.getByTransactQuerySQL("SELECT * FROM shop.tbl_category where name = 'Java';");
//		if(cateJava == null)
//		{
//			cateJava = new Categories();
//			cateJava.setName("Java");
//			cateJava.setDescription("Java");
//			cateJava.setCreatedDate(new Date());
//			
//			for(int i = 0; i < 20; i++) {
//				Products p = new Products();
//				p.setTitle("title " + i);
//				p.setPrice(new BigDecimal("10000"));
//				p.setShortDescription("short " + i);
//				p.setDetailDescription("detail " + i);
//				cateJava.addProduct(p);
//			}
//		}
//		else {
//			cateJava.setUpdatedDate(new Date());
//		}
//		
//		categoryService.saveOrUpdate(cateJava);
//	}
//}
