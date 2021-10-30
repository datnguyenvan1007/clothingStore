package com.dat.clothingStore.services;

import org.springframework.stereotype.Service;

import com.dat.clothingStore.entities.Contact;

@Service
public class ContactService extends BaseService<Contact>{

	@Override
	protected Class<Contact> clazz() {
		// TODO Auto-generated method stub
		return Contact.class;
	}
	
}
