package com.backend.daoimpl;

import com.backend.dao.ProductDetailsDAO;
import com.backend.dto.*;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.function.Predicate;


@Repository("productDetailsDAO")
@Transactional
public class ProductDetailsDAOImpl implements ProductDetailsDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Country> ListCountries() {
        try {
            return sessionFactory.getCurrentSession()
                    .createQuery("from Country",Country.class)
                    .getResultList();
        }catch (Exception ex)
        {
            ex.printStackTrace();
            return null;
        }
    }

    @Override
    public boolean addCountry(Country country) {
        try {
            sessionFactory.getCurrentSession().persist(country);
            return true;
        }catch (Exception ex)
        {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean addRate(Rates rates) {
        try {
            sessionFactory.getCurrentSession().persist(rates);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public List<Rates> getProductRates(int productId) {
       try {
           return sessionFactory.getCurrentSession()
                   .createQuery("from Rates where productId = :productId and active = true ",Rates.class)
                   .setParameter("productId",productId)
                   .getResultList();
       }catch (Exception ex)
       {
           ex.printStackTrace();
           return null;
       }
    }

    @Override
    public List<Rates> getRatesByConfirmation(boolean activation) {
       try {
           return sessionFactory.getCurrentSession().createQuery("from Rates where active = :activation",Rates.class)
                   .setParameter("activation",activation)
                   .getResultList();
       }catch (Exception ex)
       {
           ex.printStackTrace();
           return null;
       }
    }

    @Override
    public List<Rates> getAllRates() {
        try {
            return sessionFactory.getCurrentSession().createQuery("from Rates", Rates.class)
                    .getResultList();
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;

        }
    }

    @Override
    public Rates getRate(int id) {
        try {
            return sessionFactory.getCurrentSession().
                    get(Rates.class,Integer.valueOf(id));
        }catch (Exception ex)
        {
            ex.printStackTrace();
            return null;
        }
    }

    @Override
    public boolean updateRate(Rates rates) {
        try {
            sessionFactory.getCurrentSession().update(rates);
            return true;
        }catch (Exception ex){
            ex.printStackTrace();
            return false;
        }

    }

    @Override
    public List<Rates> getRatesByUserId(int userId) {
      try {
          return sessionFactory.getCurrentSession().createQuery("from Rates where userId = :userId" , Rates.class)
                  .setParameter("userId",userId).getResultList();
      }catch (Exception ex)
      {
          ex.printStackTrace();

      }
        return null;
    }

    @Override
    public List<City> ListCities() {
        try {
             return sessionFactory.getCurrentSession().createQuery("from City",City.class)
                    .getResultList();
        }catch (Exception ex)
        {
            ex.printStackTrace();
            return null;
        }
    }

    @Override
    public List<Province> ListProvincies() {
        try {
            return sessionFactory.getCurrentSession().createQuery("from Province",Province.class)
                    .getResultList();
        }catch (Exception ex)
        {
            ex.printStackTrace();
            return null;
        }
    }

    @Override
    public Province getProvinceId(String name) {
        try {
            return sessionFactory.getCurrentSession().createQuery("from Province where name like :name",Province.class)
                    .setParameter("name",name)
                    .getSingleResult();
        }catch (Exception ex){
            ex.printStackTrace();
            return null;
        }
    }

    @Override
    public List<City> getCitiesListByProvinceId(int id) {
        try {
            return sessionFactory.getCurrentSession().createQuery("from City where provinceId = :id",City.class)
                    .setParameter("id",id)
                    .getResultList();
        }catch (Exception ex){
            ex.printStackTrace();
            return null;
        }
    }

    @Override
    public boolean addBanner(Banners banners) {
        try {
            sessionFactory.getCurrentSession().persist(banners);
            return true;
        }catch (Exception ex){
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public Banners checkBannerName(String name) {
        try {
              return sessionFactory.getCurrentSession().createQuery("from Banners where name = :name",Banners.class)
            .setParameter("name",name).getSingleResult();

        }catch (Exception ex){
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Banners> getBanners() {
        try {
            return sessionFactory.getCurrentSession().createQuery("from Banners",Banners.class)
                 .getResultList();

        }catch (Exception ex){
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Brand> getBrands() {
        try {
            return sessionFactory.getCurrentSession().createQuery("from Brand",Brand.class)
                    .getResultList();

        }catch (Exception ex){
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public Brand getBrands(int id) {
        try {
            return sessionFactory
                    .getCurrentSession()
                    .get(Brand.class,Integer.valueOf(id));
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

}
