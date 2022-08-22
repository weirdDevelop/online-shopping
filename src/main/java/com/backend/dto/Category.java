package com.backend.dto;

import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;
import java.util.UUID;

@Entity
public class Category implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getImageURL() {
		return imageURL;
	}
	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}
	public boolean isActive() {
		return active;
	}
	public void setActive(boolean active) {
		this.active = active;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public List<MultipartFile> getFile() {
		return file;
	}

	public void setFile(List<MultipartFile> file) {
		this.file = file;
	}

	public int getImagesCount() {
		return imagesCount;
	}

	public void setImagesCount(int imagesCount) {
		this.imagesCount = imagesCount;
	}

	public String getImageOneCaption() {
		return imageOneCaption;
	}

	public void setImageOneCaption(String imageOneCaption) {
		this.imageOneCaption = imageOneCaption;
	}

	public String getImageSecondCaption() {
		return imageSecondCaption;
	}

	public void setImageSecondCaption(String imageSecondCaption) {
		this.imageSecondCaption = imageSecondCaption;
	}

	@Override
	public String toString() {
		return "Category{" +
				"id=" + id +
				", code='" + code + '\'' +
				", name='" + name + '\'' +
				", description='" + description + '\'' +
				", imageURL='" + imageURL + '\'' +
				", active=" + active +
				", imagesCount=" + imagesCount +
				", imageOneCaption='" + imageOneCaption + '\'' +
				", imageSecondCaption='" + imageSecondCaption + '\'' +
				", file=" + file +
				'}';
	}

	/*
                 * Private fields
                 * */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String code;

	private String name;
	
	private String description;
	
	@Column(name = "image_url")
	private String imageURL;
	
	@Column(name = "is_active")
	private boolean active = true;

	private int imagesCount;

	@Column(name = "image_One_Caption")
	private String imageOneCaption;
	@Column(name = "image_Second_Caption")
	private String imageSecondCaption;

	@Transient
	private List<MultipartFile> file;



	public Category()
	{
		this.code = "PRD" + UUID.randomUUID().toString().substring(26).toUpperCase();
	}


}
