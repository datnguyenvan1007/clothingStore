package com.dat.clothingStore.entities;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_products")
public class Products extends BaseEntity{
	
	@Column(name = "title", length = 1000, nullable = false)
	private String title;
	
	@Column(name = "price", precision = 13, scale = 2, nullable = false)
	private BigDecimal price;
	
	@Column(name = "price_sale", precision = 13, scale = 2, nullable = true)
	private BigDecimal priceSale;
	
	@Column(name = "short_description", length = 3000, nullable = false)
	private String shortDescription;

	@Lob
	@Column(name = "detail_description", columnDefinition = "LONGTEXT", nullable = false)
	private String detailDescription;

	@Column(name = "avatar", length = 200, nullable = true)
	private String avatar;
	
	@Column(name = "seo", length = 1000, nullable = true)
	private String seo;
	
	@Column(name = "is_hot_new", nullable = true)
	private int isHotNew;
	
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id") // foreign key
	private Categories categories;
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "products")
	private Set<ProductImages> productImages = new HashSet<ProductImages>();
	
	public void addProductImages(ProductImages productImgs) {
		this.productImages.add(productImgs);
		productImgs.setProducts(this);
	}
	public void deleteProductImages(ProductImages productImgs) {
		this.productImages.remove(productImgs);
		productImgs.setProducts(null);
	}
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "product")
	private Set<SaleOrderProduct> saleorderProducts = new HashSet<SaleOrderProduct>();
	
	public void addSaleOrder(SaleOrderProduct saleorderProduct) {
		saleorderProduct.setProduct(this);
		saleorderProducts.add(saleorderProduct);
	}
	
	public void deleteSaleOrder(SaleOrderProduct saleorderProduct) {
		saleorderProduct.setProduct(null);
		saleorderProducts.remove(saleorderProduct);
	}
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public BigDecimal getPriceSale() {
		return priceSale;
	}

	public void setPriceSale(BigDecimal priceSale) {
		this.priceSale = priceSale;
	}

	public String getShortDescription() {
		return shortDescription;
	}

	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}

	public String getDetailDescription() {
		return detailDescription;
	}

	public void setDetailDescription(String detailDescription) {
		this.detailDescription = detailDescription;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public int getIsHotNew() {
		return isHotNew;
	}

	public void setIsHotNew(int isHotNew) {
		this.isHotNew = isHotNew;
	}

	public Set<ProductImages> getProductImages() {
		return productImages;
	}
	public void setProductImages(Set<ProductImages> productImages) {
		this.productImages = productImages;
	}
	public Categories getCategories() {
		return categories;
	}

	public void setCategories(Categories categories) {
		this.categories = categories;
	}
	public Set<SaleOrderProduct> getSaleorderProducts() {
		return saleorderProducts;
	}
	public void setSaleorderProducts(Set<SaleOrderProduct> saleorderProducts) {
		this.saleorderProducts = saleorderProducts;
	}
	
	
}
