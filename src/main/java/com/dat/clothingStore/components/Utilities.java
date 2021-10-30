package com.dat.clothingStore.components;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.github.slugify.Slugify;

public class Utilities {
	
	public static String slugify(String seo) {
		
		return new Slugify().slugify(seo);
	}
	
	public static String encode(String password) {
		return new BCryptPasswordEncoder(4).encode(password);
	}
	
	public static void main(String[] args) {
		System.out.println(new BCryptPasswordEncoder(4).encode("1234"));
	}
}
