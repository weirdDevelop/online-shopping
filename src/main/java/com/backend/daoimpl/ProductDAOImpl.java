package com.backend.daoimpl;

import com.backend.dao.ProductDAO;
import com.backend.dto.Brand;
import com.backend.dto.Product;

import com.backend.dto.Species;
import com.backend.dto.Warranty;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository("productDAO")
@Transactional
public class ProductDAOImpl implements ProductDAO {

    @Autowired
    private SessionFactory sessionFactory;


    String permanentuery="";
    /*
     * SINGLE
	 * */

    @Override
    public Product get(int productId) {
        try {
            return sessionFactory
                    .getCurrentSession()
                    .get(Product.class, Integer.valueOf(productId));
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

	/*
	 * LIST
	 * */

    @Override
    public List<Product> list() {
        return sessionFactory
                .getCurrentSession()
                .createQuery("FROM Product", Product.class)
                .getResultList();
    }

    /*
     * INSERT
     * */
    @Override
    public boolean add(Product product) {
        try {
            sessionFactory
                    .getCurrentSession()
                    .persist(product);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    /*
     * UPDATE
     * */
    @Override
    public boolean update(Product product) {
        try {
            sessionFactory
                    .getCurrentSession()
                    .update(product);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }


    /*
     * DELETE
     * */
    @Override
    public boolean delete(Product product) {
        try {

            product.setActive(false);
            // call the update method
            return this.update(product);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Product> listActiveProducts() {
        String selectActiveProducts = "FROM Product WHERE active = :active";
        return sessionFactory
                .getCurrentSession()
                .createQuery(selectActiveProducts, Product.class)
                .setParameter("active", true)
                .getResultList();
    }

    @Override
    public List<Product> listActiveProductsByCategory(int categoryId) {
        String selectActiveProductsByCategory = "FROM Product WHERE active = :active AND categoryId = :categoryId";
        return sessionFactory
                .getCurrentSession()
                .createQuery(selectActiveProductsByCategory, Product.class)
                .setParameter("active", true)
                .setParameter("categoryId", categoryId)
                .getResultList();
    }

    @Override
    public List<Product> listActiveProductsBySubCategory(int subCategoryId) {
        return sessionFactory.getCurrentSession().
                createQuery("FROM Product WHERE active = :active AND subCategoryId = :subCategoryId", Product.class)
                .setParameter("active", true)
                .setParameter("subCategoryId", subCategoryId)
                .getResultList();
    }

    @Override
    public List<Product> listActiveProductsByBrand(String brandName) {
        return sessionFactory.getCurrentSession().
                createQuery("FROM Product WHERE active = :active AND brand = :brandName", Product.class)
                .setParameter("active", true)
                .setParameter("brandName", brandName)
                .getResultList();
    }

    @Override
    public List<Product> getLatestActiveProducts(int count) {
        return sessionFactory
                .getCurrentSession()
                .createQuery("FROM Product WHERE active = :active ORDER BY id", Product.class)
                .setParameter("active", true)
                .setFirstResult(0)
                .setMaxResults(count)
                .getResultList();
    }


    @Override
    public List<Product> getSearchedProducts(String name, int categoryId, int firstResult, String sort, String sortBy) {
        String query = "from Product p where p.active = true and p.name like :search order by :sort " + sortBy;
        try {
            return sessionFactory.getCurrentSession().createQuery(query, Product.class)
                    .setParameter("search", "%" + name + "%")
                    .setParameter("sort", sort)
                    .setFirstResult(firstResult)
                    .setMaxResults(10)
                    .getResultList();
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }

    }

    @Override
    public int searchCount(int categoryId, String name) {
        try {
            String query = "select count(id) from Product where active = true and name like :search";
            double result = (Long) sessionFactory.getCurrentSession().createQuery(query)
                    .setParameter("search", "%" + name + "%")
                    .uniqueResult();
            int count = (int) Math.ceil(result / 10);
            return count;

        } catch (Exception ex) {
            ex.printStackTrace();
            return 0;
        }

    }

    @Override
    public List<Species> getSpeciesBySub(int subId) {
        try {
            return sessionFactory.getCurrentSession().
                    createQuery("from Species where subId = :id")
                    .setParameter("id", subId)
                    .getResultList();
        }catch (Exception ex)
        {
            ex.printStackTrace();
            return null;
        }
    }

    @Override
    public boolean addBrand(Brand brand) {
       try {
           sessionFactory.getCurrentSession()
                   .persist(brand);
           return true;
       }catch (Exception ex)
       {
           ex.printStackTrace();
           return false;
       }
    }

    @Override
    public List<Brand> brandsList() {
       try {
           return sessionFactory.getCurrentSession()
                   .createQuery("from Brand",Brand.class)
                   .getResultList();
       }catch (Exception ex)
       {
           ex.printStackTrace();
           return null;
       }
    }

    @Override
    public List<Warranty> ListWarranties() {
        try {
            return sessionFactory.getCurrentSession()
                    .createQuery("from Warranty", Warranty.class)
                    .getResultList();
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;

        }
    }

    @Override
    public boolean addWarranty(Warranty warranty) {
        try {
            sessionFactory.getCurrentSession()
                    .persist(warranty);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public Warranty getWarranty(int productWarrantyId) {
        try {
            return sessionFactory.getCurrentSession()
                    .createQuery("from Warranty where id = :WarrantyId", Warranty.class)
                    .setParameter("WarrantyId", productWarrantyId)
                    .getSingleResult();
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }

    @Override
    public boolean addSpecies(Species species) {
        try {
            sessionFactory.getCurrentSession().persist(species);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public List<Species> getSpeciesList() {
        return sessionFactory.getCurrentSession().createQuery("from Species",Species.class)
                .getResultList();
    }



    @Override
    public List<Product> getProductsByParam(String param, int count) {


        String query = "FROM Product WHERE active = true ORDER BY " + param + " DESC";

        return sessionFactory
                .getCurrentSession()
                .createQuery(query, Product.class)
                .setFirstResult(0)
                .setMaxResults(count)
                .getResultList();
    }
}
