package com.dat.clothingStore.services;

import org.springframework.stereotype.Service;

import com.dat.clothingStore.entities.Roles;

@Service
public class RoleService extends BaseService<Roles>{

	@Override
	protected Class<Roles> clazz() {
		// TODO Auto-generated method stub
		return Roles.class;
	}
	

}
