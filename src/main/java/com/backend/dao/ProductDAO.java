package com.backend.dao;


import com.backend.dto.Brand;
import com.backend.dto.Product;
import com.backend.dto.Species;
import com.backend.dto.Warranty;

import java.util.List;

public interface ProductDAO{

	Product get(int productId);
	List<Product> list();
	boolean add(Product product);
	boolean update(Product product);
	boolean delete(Product product);

	List<Product> getProductsByParam(String param, int count);	
	
	
	// business methods
	List<Product> listActiveProducts();	
	List<Product> listActiveProductsByCategory(int categoryId);
	List<Product> listActiveProductsBySubCategory(int subCategoryId);
	List<Product> listActiveProductsByBrand(String brandName);
	List<Product> getLatestActiveProducts(int count);

	List<Product> getSearchedProducts(String name, int categoryId,int firstResult, String sort, String sortBy);
	int searchCount(int categoryId, String name);

	List<Warranty> ListWarranties();
	boolean addWarranty(Warranty warranty);
	Warranty getWarranty(int productWarrantyId);

	boolean addSpecies(Species species);
	List<Species> getSpeciesList();

	List<Species> getSpeciesBySub(int subId);

	boolean addBrand(Brand brand);
	List<Brand> brandsList();

}
