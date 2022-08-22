package com.backend.dao;

import com.backend.dto.*;

import java.util.List;

public interface ProductDetailsDAO {

    List<Country> ListCountries();
    boolean addCountry(Country country);

    boolean addRate(Rates rates);
    List<Rates> getProductRates(int productId);

    List<Rates> getRatesByConfirmation(boolean activation);

    List<Rates> getAllRates();

    Rates getRate(int id);

    boolean updateRate(Rates rates);

    List<Rates> getRatesByUserId(int userId);

    List<City> ListCities();
    List<Province> ListProvincies();

    Province getProvinceId(String name);
    List<City> getCitiesListByProvinceId(int id);

    boolean addBanner(Banners banners);

    Banners checkBannerName(String name);

    List<Banners> getBanners();

    List<Brand> getBrands();

    Brand getBrands(int id);
}
