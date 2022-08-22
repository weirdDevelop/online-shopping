package com.backend.daoimpl;


import com.backend.dao.CategoryDAO;
import com.backend.dto.Category;
import com.backend.dto.SubCategory;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import java.util.List;

@Repository("categoryDAO")
@Transactional
public class CategoryDAOImpl implements CategoryDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Category> list() {

		String selectActiveCategory = "FROM Category WHERE active = :active order by id";

		Query query = sessionFactory.getCurrentSession().createQuery(selectActiveCategory);

		query.setParameter("active", true);

		return query.getResultList();


	}
	/*
	 * Getting single category based on id
	 */
	@Override
	public Category get(int id) {

		return sessionFactory.getCurrentSession().get(Category.class, Integer.valueOf(id));

	}

	@Override

	public boolean add(Category category) {

		try {
			// add the category to the database table
			sessionFactory.getCurrentSession().persist(category);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}

	}

	/*
	 * Updating a single category
	 */
	@Override
	public boolean update(Category category) {

		try {
			// add the category to the database table
			sessionFactory.getCurrentSession().update(category);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean delete(Category category) {

		category.setActive(false);

		try {
			// add the category to the database table
			sessionFactory.getCurrentSession().update(category);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

	@Override
	public List<SubCategory> listSubs() {
		try {

		  return sessionFactory.
					getCurrentSession()
					.createQuery("from SubCategory where active = :active order by id",SubCategory.class)
					.setParameter("active",true)
					.getResultList();
		}catch (Exception ex)
		{
			ex.printStackTrace();
			return null;
		}

	}

	@Override
	public boolean addSubCategory(SubCategory subCategory) {
		try {
			sessionFactory.getCurrentSession().persist(subCategory);
			return true;
		}catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

	@Override
	public List<SubCategory> getSubsByCategory(int CategoryId) {

		try {
			return sessionFactory.
					getCurrentSession().
					createQuery("from SubCategory where categoryId = :categoryId",SubCategory.class)
					.setParameter("categoryId", CategoryId)
					.getResultList();
		}catch (Exception ex)
		{
			ex.printStackTrace();
			return null;
		}


	}

	@Override
	public SubCategory getSubCat(int id) {
		return sessionFactory.getCurrentSession().get(SubCategory.class,Integer.valueOf(id));

	}

	@Override
	public SubCategory getSub(int id) {
		try {
			return sessionFactory.getCurrentSession().get(SubCategory.class,Integer.valueOf(id));
		}catch (Exception ex)
		{
			ex.printStackTrace();
			return null;
		}
	}


}
