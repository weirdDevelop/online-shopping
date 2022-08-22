package com.onlineshopping.controller;

import com.backend.config.JalaliCalender;
import com.backend.dao.CategoryDAO;
import com.backend.dao.ProductDAO;
import com.backend.dao.ProductDetailsDAO;
import com.backend.dto.*;
import com.onlineshopping.exception.ProductNotFoundException;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;


@Controller
public class PageController {

    private static final Logger logger = LoggerFactory.getLogger(PageController.class);

    @Autowired
    private CategoryDAO categoryDAO;

    @Autowired
    private ProductDAO productDAO;
    @Autowired
    private ProductDetailsDAO productDetailsDAO;

    Map<Category, List<SubCategory>> categoryListMapAll = new HashMap<Category, List<SubCategory>>();

    @RequestMapping(value = {"/", "/home", "/index"})
    public ModelAndView index(@RequestParam(name = "logout", required = false) String logout) {
        ModelAndView mv = new ModelAndView("page");
        mv.addObject("title", "Home");

        logger.info("Inside PageController index method - INFO");
        logger.debug("Inside PageController index method - DEBUG");

        List<Category> getCategories = categoryDAO.list();

        Map<Category, List<SubCategory>> categoryListMap = new HashMap<Category, List<SubCategory>>();
        for (Category category : getCategories) {
            categoryListMap.put(category, categoryDAO.getSubsByCategory(category.getId()));
        }

        //passing the list of categories
        categoryListMapAll = categoryListMap;

        mv.addObject("categories", categoryListMap);
        List<Banners> mainBanners=new ArrayList<>();
        List<Banners> brandBanners=new ArrayList<>();
        List<Banners> categoryBanners=new ArrayList<>();
        for (Banners banners:productDetailsDAO.getBanners()
             ) {
            if(banners.getName().matches("(.*)main_banner(.*)")) {

                mainBanners.add(banners);
            }
            if(banners.getName().matches("(.*)category_banner(.*)")) {

                categoryBanners.add(banners);
            }
            if(banners.getName().matches("(.*)product_banner(.*)")) {

                brandBanners.add(banners);
            }
        }

        //passing the list of banners
        mv.addObject("mainBanners",mainBanners);
        mv.addObject("brandBanners",brandBanners);
        mv.addObject("categoryBanners",categoryBanners);

        mv.addObject("mvProduct",productDAO.getProductsByParam("views",10));
        mv.addObject("mdProduct",productDAO.getProductsByParam("discount",10));
        mv.addObject("mpProduct",productDAO.getProductsByParam("purchases",10));

        //add brands  to mv
        mv.addObject("brands",productDetailsDAO.getBrands());

        if (logout != null) {
            mv.addObject("message", "با موفقیت از سیستم خارج شدید!");
        }

        mv.addObject("userClickHome", true);
        return mv;
    }

    @RequestMapping(value = "/about")
    public ModelAndView about() {
        ModelAndView mv = new ModelAndView("page");
        mv.addObject("title", "About Us");
        mv.addObject("userClickAbout", true);
        return mv;
    }

    @RequestMapping(value = "/contact")
    public ModelAndView contact() {
        ModelAndView mv = new ModelAndView("page");
        mv.addObject("title", "Contact Us");
        mv.addObject("userClickContact", true);
        return mv;
    }

	
	/*
	 * Methods to load all the products and based on category
	 * */

    @RequestMapping(value = "/show/all/products")
    public ModelAndView showAllProducts() {
        ModelAndView mv = new ModelAndView("page");
        mv.addObject("title", "All Products");

        //passing the list of categories
        mv.addObject("categories", categoryListMapAll);

        mv.addObject("userClickAllProducts", true);
        return mv;
    }

    @RequestMapping(value = "/show/category/{id}/products")
    public ModelAndView showCategoryProducts(@PathVariable("id") int id) {
        ModelAndView mv = new ModelAndView("page");

        // categoryDAO to fetch a single category
        Category category = null;

        category = categoryDAO.get(id);

        mv.addObject("title", category.getName());

        //passing the list of categories
        mv.addObject("categories", categoryListMapAll);

        // passing the single category object
        mv.addObject("category", category);

        mv.addObject("userClickCategoryProducts", true);
        return mv;
    }

    @RequestMapping("/show/search/{firstResult}/product")
    public ModelAndView showSearchedProduct( @PathVariable int firstResult, @RequestParam String SearchName,
                                            @RequestParam String sort,@RequestParam String sortBy,
                                             @RequestParam int currentPage, HttpServletRequest request) {
        String name="";
        if(SearchName.equals("searchProduct"))
        {
           name =StringUtils.normalizeSpace(request.getParameter("searchText"));
        }else
        {
            name=SearchName;
        }
        if(firstResult>0)
        {
            firstResult-=1;
        }
        int catId=1;
        ModelAndView mv = new ModelAndView("page");
        mv.addObject("searchedName",name);
        mv.addObject("sort",sort);
        mv.addObject("currentPage",currentPage);
        mv.addObject("sortBy",sortBy);
        mv.addObject("pagesCount", productDAO.searchCount(catId, name));
        mv.addObject("resultProduct", productDAO.getSearchedProducts(name, catId, firstResult, sort, sortBy));
        mv.addObject("title", "Search Results for" + name);
        mv.addObject("userSearchedProducts", true);
        return mv;
    }


    @RequestMapping(value = "/show/subCategory/{id}/products")
    public ModelAndView showProductBySubCategory(@PathVariable("id") int id) {
        ModelAndView mv = new ModelAndView("page");

        Category category=null;
        SubCategory subCategory = null;

        subCategory = categoryDAO.getSubCat(id);
        category=categoryDAO.get(subCategory.getCategoryId());

        mv.addObject("title", subCategory.getName());

        //passing the list of categories
        mv.addObject("categories", categoryListMapAll);

        // passing the single category object
        mv.addObject("category", category);

        // passing the single subCategory object
        mv.addObject("subCategory", subCategory);

        mv.addObject("userClickSubCategoryProducts", true);
        return mv;
    }

	
	/*
	 * Viewing a single product
	 * */

    @RequestMapping(value = "/show/{id}/product")
    public ModelAndView showSingleProduct(@PathVariable int id) throws ProductNotFoundException {

        ModelAndView mv = new ModelAndView("page");

        Product product = productDAO.get(id);

        if (product == null) throw new ProductNotFoundException();

        // update the view count
        product.setViews(product.getViews() + 1);
        productDAO.update(product);
        //---------------------------

        mv.addObject("title", product.getName());
        mv.addObject("product", product);
        mv.addObject("category", categoryDAO.get(product.getCategoryId()).getName());
        mv.addObject("subCategory", categoryDAO.getSub(product.getSubCategoryId()).getName());
        mv.addObject("Rates",productDetailsDAO.getProductRates(product.getId()));
        mv.addObject("userClickShowProduct", true);



        return mv;

    }

    @RequestMapping(value = "/show/brand/{id}/products")
    public ModelAndView showBrandsProduct(@PathVariable int id) throws ProductNotFoundException {

        ModelAndView mv= new ModelAndView("page");
        Brand brand=null;

        brand = productDetailsDAO.getBrands(id);

        mv.addObject("title", brand.getName());

        //passing the list of categories
        mv.addObject("categories", categoryListMapAll);

        // passing the single category object
        mv.addObject("brand", brand);

        mv.addObject("userClickBrandProducts", true);
        return mv;



    }



    /*rate product*/
    @RequestMapping(value = "/user/{productId}/rate/{userId}", method = RequestMethod.POST)
    public String rating(@ModelAttribute("rate") Rates mRate, @PathVariable("productId") int ProductId,@PathVariable("userId") int userId,
                         HttpServletRequest request) {
        mRate.setProductId(ProductId);
        mRate.setActive(false);
        mRate.setUserId(userId);
        int Year= Calendar.getInstance().get(Calendar.YEAR);
        int Month= Calendar.getInstance().get(Calendar.MONTH);
        int Day= Calendar.getInstance().get(Calendar.DAY_OF_MONTH);
        mRate.setTimeSent(JalaliCalender.gregorianToJalali(new JalaliCalender.YearMonthDate(Year,Month,Day)).toString());

        productDetailsDAO.addRate(mRate);
        return "redirect:" + request.getHeader("Referer") + "?success=rate";
    }



    @RequestMapping(value = "/membership")
    public ModelAndView register() {
        ModelAndView mv = new ModelAndView("page");

        logger.info("Page Controller membership called!");

        return mv;
    }


    @RequestMapping(value = "/login")
    public ModelAndView login(@RequestParam(name = "error", required = false) String error,
                              @RequestParam(name = "logout", required = false) String logout) {
        ModelAndView mv = new ModelAndView("login");
        mv.addObject("title", "Login");
        mv.addObject("categories", categoryListMapAll);
        if (error != null) {
            mv.addObject("message", "نام کاربری و پسورد نا معتبر است!");
        }
        if (logout != null) {
            mv.addObject("logout", "شما با موفقیت از سیستم سیستم شدید!");
        }
        return mv;
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        // Invalidates HTTP Session, then unbinds any objects bound to it.
        // Removes the authentication from securitycontext
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }

        return "redirect:/login?logout";
    }


    @RequestMapping(value = "/access-denied")
    public ModelAndView accessDenied() {
        ModelAndView mv = new ModelAndView("error");
        mv.addObject("errorTitle", "متاسفیم!");
        mv.addObject("errorDescription", "شما اجازه دسترسی به این صفحه را ندارید!");
        mv.addObject("title", "403 Access Denied");
        mv.addObject("userError",true);
        return mv;
    }

    @ModelAttribute("rate")
    public Rates ModelRate() {
        return new Rates();
    }


}
