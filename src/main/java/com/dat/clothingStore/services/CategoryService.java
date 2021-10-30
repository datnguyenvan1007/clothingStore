package com.dat.clothingStore.services;

import org.springframework.stereotype.Service;

import com.dat.clothingStore.dto.CategorySearchModel;
import com.dat.clothingStore.entities.Categories;

@Service
public class CategoryService  extends BaseService<Categories>{

	@Override
	protected Class<Categories> clazz() {
		// TODO Auto-generated method stub
		return Categories.class;
	}
	
	public PagerData<Categories> search(CategorySearchModel searchModel){
		
		String sql = "select * from tbl_category c where 1=1 ";
		if(searchModel != null) {
			if(searchModel.getKeyword() != null) {
				sql += " and c.name like '%" + searchModel.getKeyword() + "%' or c.description like '%" + 
						searchModel.getKeyword() + "%'";
			}
			if(searchModel.getSeo() != null) {
				sql += " and c.seo like '%" + searchModel.getSeo() + "%'";
			}
		}
		return runTransactQuerySQL(sql, searchModel == null ? 0 : searchModel.getPage());
	}
}
