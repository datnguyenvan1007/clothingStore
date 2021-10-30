package com.dat.clothingStore.services;

import org.springframework.stereotype.Service;

import com.dat.clothingStore.entities.SaleOrderProduct;

@Service
public class SaleOrderProductService extends BaseService<SaleOrderProduct>{

	@Override
	protected Class<SaleOrderProduct> clazz() {
		// TODO Auto-generated method stub
		return SaleOrderProduct.class;
	}
	
}
