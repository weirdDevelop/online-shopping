package com.backend.dto;


import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import javax.validation.constraints.Min;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Component
@Entity
public class Product implements Serializable {

	private static final long serialVersionUID = 1L;
	
	// private fields
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String code;
	@NotBlank(message = "لظفا نام کالا را وارد کنید!")
	private String name;
	@NotBlank(message = "لظفا توضیحات را وارد کنید!")
	private String description;
	@Column(name = "unit_price")
	@Min(value = 1, message="قیمت باید مثبت باشد!")
	private double unitPrice;
	private int quantity;
	@Column(name = "is_active")	
	private boolean active;
	@Column(name = "category_id")
	private int categoryId;
	@Column(name = "subCategory_id")
	private int subCategoryId;
	@Column(name = "supplier_id")
	@JsonIgnore
	private int supplierId;
	private int purchases;
	private int views;
	private int discount;
	@Min(value = 1, message="وزن محصول باید مثبت باشد!")
	private float weight;
	private String accessories;
	private int watt;
	private String warranty;
	private String brand;
	private String species;
	private String country;
	@Column(name = "rate_count")
	private int rateCount;
	@Column(name = "product_score")
	private float productScore;
	private int imagesCount;
	@Column(name = "pre_description")
	@NotBlank(message = "لطفا توضیحات کوتاه را وراد کنید!")
	private String preDescription;
	private String lastUpdate;
	@Column
	private String creationTime;

	@Transient
	private List<MultipartFile> file;

	public List<MultipartFile> getFile() {
		return file;
	}

	public void setFile(List<MultipartFile> file) {
		this.file = file;
	}

	// default constructor
	public Product() {

		this.code = "PRD" + UUID.randomUUID().toString().substring(26).toUpperCase();
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
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

	public double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public int getSubCategoryId() {
		return subCategoryId;
	}

	public void setSubCategoryId(int subCategoryId) {
		this.subCategoryId = subCategoryId;
	}

	public int getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(int supplierId) {
		this.supplierId = supplierId;
	}

	public int getPurchases() {
		return purchases;
	}

	public void setPurchases(int purchases) {
		this.purchases = purchases;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public float getWeight() {
		return weight;
	}

	public void setWeight(float weight) {
		this.weight = weight;
	}

	public String getAccessories() {
		return accessories;
	}

	public void setAccessories(String accessories) {
		this.accessories = accessories;
	}

	public int getWatt() {
		return watt;
	}

	public void setWatt(int watt) {
		this.watt = watt;
	}

	public String getWarranty() {
		return warranty;
	}

	public void setWarranty(String warranty) {
		this.warranty = warranty;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getSpecies() {
		return species;
	}

	public void setSpecies(String species) {
		this.species = species;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public int getRateCount() {
		return rateCount;
	}

	public void setRateCount(int rateCount) {
		this.rateCount = rateCount;
	}

	public float getProductScore() {
		return productScore;
	}

	public void setProductScore(float productScore) {
		this.productScore = productScore;
	}

	public int getImagesCount() {
		return imagesCount;
	}

	public void setImagesCount(int imagesCount) {
		this.imagesCount = imagesCount;
	}

	public String getPreDescription() {
		return preDescription;
	}

	public void setPreDescription(String preDescription) {
		this.preDescription = preDescription;
	}

	public String getLastUpdate() {
		return lastUpdate;
	}

	public void setLastUpdate(String lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

	public String getCreationTime() {
		return creationTime;
	}

	public void setCreationTime(String creationTime) {
		this.creationTime = creationTime;
	}

	@Override
	public String toString() {
		return "Product{" +
				"id=" + id +
				", code='" + code + '\'' +
				", name='" + name + '\'' +
				", description='" + description + '\'' +
				", unitPrice=" + unitPrice +
				", quantity=" + quantity +
				", active=" + active +
				", categoryId=" + categoryId +
				", subCategoryId=" + subCategoryId +
				", supplierId=" + supplierId +
				", purchases=" + purchases +
				", views=" + views +
				", discount=" + discount +
				", weight=" + weight +
				", accessories='" + accessories + '\'' +
				", watt=" + watt +
				", warranty='" + warranty + '\'' +
				", brand='" + brand + '\'' +
				", species='" + species + '\'' +
				", country='" + country + '\'' +
				", rateCount=" + rateCount +
				", productScore=" + productScore +
				", imagesCount=" + imagesCount +
				", preDescription='" + preDescription + '\'' +
				", lastUpdate='" + lastUpdate + '\'' +
				", creationTime='" + creationTime + '\'' +
				", file=" + file +
				'}';
	}
}
