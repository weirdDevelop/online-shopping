package com.backend.dao;


import com.backend.dto.Category;
import com.backend.dto.SubCategory;

import java.util.List;

public interface CategoryDAO {

	
	
	Category get(int id);
	List<Category> list();
	boolean add(Category category);
	boolean update(Category category);
	boolean delete(Category category);
	List<SubCategory> listSubs();

	boolean addSubCategory(SubCategory subCategory);
	List<SubCategory> getSubsByCategory(int CategoryId);
	SubCategory getSubCat(int id);

	SubCategory getSub(int id);


}
