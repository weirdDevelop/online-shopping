package com.onlineshopping.controller;


import com.backend.dao.CartLineDAO;
import com.backend.dao.CategoryDAO;
import com.backend.dao.ProductDAO;
import com.backend.dao.ProductDetailsDAO;
import com.backend.dto.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/json/data")
public class JsonDataController {

    @Autowired
    private ProductDAO productDAO;

    @Autowired
    private CategoryDAO categoryDAO;

    @Autowired
    private CartLineDAO cartLineDAO;

    @Autowired
    private ProductDetailsDAO productDetailsDAO;


    @RequestMapping("/admin/all/products")
    @ResponseBody
    public List<Product> getAllProductsList() {
        return productDAO.list();
    }


    @RequestMapping("/all/products")
    @ResponseBody
    public List<Product> getAllProducts() {

        return productDAO.listActiveProducts();

    }

    @RequestMapping("/category/{id}/products")
    @ResponseBody
    public List<Product> getProductsByCategory(@PathVariable int id) {

        return productDAO.listActiveProductsByCategory(id);
    }

    @RequestMapping("/admin/orders/{confirmStatus}/details")
    @ResponseBody
    public List<OrderDetail> getOrders(@PathVariable int confirmStatus) {
        if (confirmStatus == 0) {
            return cartLineDAO.getOrdersList(false);
        }
        return cartLineDAO.getOrdersList(true);
    }

    @RequestMapping("/subCategory/{id}/products")
    @ResponseBody
    public List<Product> getProductsBySubCategory(@PathVariable int id) {

        return productDAO.listActiveProductsBySubCategory(id);

    }

    @RequestMapping("/brand/{id}/products")
    @ResponseBody
    public List<Product> getProductsByBrand(@PathVariable int id) {

        Brand brand=productDetailsDAO.getBrands(id);
        return productDAO.listActiveProductsByBrand(brand.getName());

    }

    @RequestMapping("/admin/unConfirmedRates")
    @ResponseBody
    public List<Rates> getUnconfirmedRates() {
        return productDetailsDAO.getRatesByConfirmation(false);
    }

    @RequestMapping("/admin/allRates")
    @ResponseBody
    public List<Rates> getAllRates() {
        return productDetailsDAO.getAllRates();
    }

    @RequestMapping("/orderDetails/{id}/orderItems")
    @ResponseBody
    public List<OrderItem> getOrderItems(@PathVariable int id) {
        return cartLineDAO.getOrderItemsByOrderDetail(id);
    }


    @RequestMapping("/admin/category/{id}/subCategory")
    @ResponseBody
    public List<SubCategory> getSubForSelectedCategory(@PathVariable int id) {
        return categoryDAO.getSubsByCategory(id);
    }

    @RequestMapping("/admin/subCategory")
    @ResponseBody
    public List<Species> getSpecies() {
        return productDAO.getSpeciesList();
    }

    @RequestMapping("/admin/subCategory/{id}/species")
    @ResponseBody
    public List<Species> getSpecies(@PathVariable int id) {
        return productDAO.getSpeciesBySub(id);
    }

    @RequestMapping("/not")
    @ResponseBody
    public List<Rates> noName(@PathVariable int id) {

        return productDetailsDAO.getRatesByUserId(id);
    }

    @RequestMapping("/province/city")
    @ResponseBody
    public List<City> getSubForSelectedCategory(@RequestParam String provinceName) {
        int id = productDetailsDAO.getProvinceId(provinceName).getId();
        return productDetailsDAO.getCitiesListByProvinceId(id);
    }


    @RequestMapping("/admin/all/categories")
    @ResponseBody
    public List<Category> getCategories() {

      return categoryDAO.list();
    }

    @RequestMapping("/admin/all/subCategories")
    @ResponseBody
    public List<SubCategory> getSubCategories() {

        return categoryDAO.listSubs();
    }

    @RequestMapping("/mv/products")
    @ResponseBody
    public List<Product> getMostViewedProducts() {
        return productDAO.getProductsByParam("views", 10);
    }

    @RequestMapping("/mp/products")
    @ResponseBody
    public List<Product> getMostPurchasedProducts() {
        return productDAO.getProductsByParam("purchases", 10);
    }

    @RequestMapping("/discount/products")
    @ResponseBody
    public List<Product> getMostDiscountedProducts() {
        return productDAO.getProductsByParam("discount", 10);
    }




}
