package com.dat.clothingStore.dto;

public class ProductSearchModel extends BaseSearchModel{
	
	
	private Integer categoryId;
	
	private Integer isHotNew;
	

	public Integer getCategoryId() {
		return categoryId;
	}


	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}


	public Integer getIsHotNew() {
		return isHotNew;
	}


	public void setIsHotNew(Integer isHotNew) {
		this.isHotNew = isHotNew;
	}
	
	
	
}
