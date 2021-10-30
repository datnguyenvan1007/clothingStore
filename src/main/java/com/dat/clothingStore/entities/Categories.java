package com.dat.clothingStore.entities;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import net.bytebuddy.asm.Advice.This;

//import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "tbl_category")
public class Categories extends BaseEntity {

	@Column(name = "name", length = 100, nullable = false)
	private String name;

	@Column(name = "description", length = 100, nullable = false)
	private String description;

	@Column(name = "seo", length = 1000, nullable = true)
	private String seo;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "parent_id") // foreign key
	private Categories parent;
	
	@OneToMany(cascade = CascadeType.ALL,fetch = FetchType.LAZY, mappedBy = "parent")
    private Set<Categories> child = new HashSet<>();

	// Trong phia OneToMany can dinh nghia 2 methods 
	// tro giup cho viec them moi va xoa.
	public void addChild(Categories category) {
		this.child.add(category);
		category.setParent(this);
	}
	public void deleteChild(Categories category) {
		this.child.remove(category);
		category.setParent(null);
	}
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "categories")
    private Set<Products> products = new HashSet<Products>();

	// Trong phia OneToMany can dinh nghia 2 methods 
	// tro giup cho viec them moi va xoa.
	public void addProduct(Products product) {
		this.products.add(product);
		product.setCategories(this);
	}
	public void deleteProduct(Products product) {
		this.products.remove(product);
		product.setCategories(null);
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	
	public Set<Products> getProducts() {
		return products;
	}
	public void setProducts(Set<Products> products) {
		this.products = products;
	}
	public Categories getParent() {
		return parent;
	}
	public void setParent(Categories parent) {
		this.parent = parent;
	}
	public Set<Categories> getChild() {
		return child;
	}
	public void setChild(Set<Categories> child) {
		this.child = child;
	}
	
	
}
