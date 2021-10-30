package com.dat.clothingStore.services;

import org.springframework.stereotype.Service;

import com.dat.clothingStore.entities.SaleOrder;

@Service
public class SaleOrderService extends BaseService<SaleOrder>{

	@Override
	protected Class<SaleOrder> clazz() {
		// TODO Auto-generated method stub
		return SaleOrder.class;
	}

}
