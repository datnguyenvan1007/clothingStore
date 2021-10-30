package com.dat.clothingStore.services;

import org.springframework.stereotype.Service;

import com.dat.clothingStore.entities.ProductImages;

@Service
public class ProductImageService extends BaseService<ProductImages>{

	@Override
	protected Class<ProductImages> clazz() {
		// TODO Auto-generated method stub
		return ProductImages.class;
	}

}
