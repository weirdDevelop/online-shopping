package com.onlineshopping.controller;


import com.backend.config.JalaliCalender;
import com.backend.dao.CartLineDAO;
import com.backend.dao.CategoryDAO;
import com.backend.dao.ProductDAO;
import com.backend.dao.ProductDetailsDAO;
import com.backend.dto.*;
import com.onlineshopping.util.FileUtil;
import com.onlineshopping.validator.ProductValidator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/manage")
public class ManagementController {

    private static final Logger logger = LoggerFactory.getLogger(ManagementController.class);

    @Autowired
    private ProductDAO productDAO;

    @Autowired
    private CategoryDAO categoryDAO;

    @Autowired
    private ProductDetailsDAO productDetailsDAO;

    @Autowired
    private CartLineDAO cartLineDAO;

    Map<Category, List<SubCategory>> categoryListMapAll = new HashMap<Category, List<SubCategory>>();

    @RequestMapping("/product")
    public ModelAndView manageProduct(@RequestParam(name = "success", required = false) String success) {

        ModelAndView mv = new ModelAndView("page");
        mv.addObject("title", "Product Management");
        mv.addObject("userClickManageProduct", true);


        List<Category> getCategories = categoryDAO.list();

        Map<Category, List<SubCategory>> categoryListMap = new HashMap<Category, List<SubCategory>>();
        for (Category category : getCategories) {
            categoryListMap.put(category, categoryDAO.getSubsByCategory(category.getId()));
        }

        categoryListMapAll = categoryListMap;


        //passing the list of categories
        mv.addObject("categories", categoryListMapAll);


        Product nProduct = new Product();

        // assuming that the user is ADMIN
        // later we will fixed it based on user is SUPPLIER or ADMIN
        nProduct.setSupplierId(1);
        nProduct.setActive(true);
        nProduct.setRateCount(0);
        nProduct.setProductScore(0);

        int Year = Calendar.getInstance().get(Calendar.YEAR);
        int Month = Calendar.getInstance().get(Calendar.MONTH);
        int Day = Calendar.getInstance().get(Calendar.DAY_OF_MONTH);
        nProduct.setCreationTime(JalaliCalender.gregorianToJalali(new JalaliCalender.YearMonthDate(Year, Month, Day)).toString());


        mv.addObject("product", nProduct);

        if (success != null) {
            switch (success) {
                case "product":
                    mv.addObject("message", "محصول با موفقیت ثبت شد!");
                    break;

                case "category":
                    mv.addObject("message", "دسته بندی با موفقیت ثبت شد!");
                    break;

                case "subCategory":
                    mv.addObject("message", "زیر دسته با موفقیت ثبت شد!");
                    break;

                case "species":
                    mv.addObject("message", "ویژگی خاص با موفقیت ثبت شد!");
                    break;

                case "warranty":
                    mv.addObject("message", "گارانتی با موفقیت ثبت شد!");
                    break;

                case "brand":
                    mv.addObject("message", "برند با موفقیت ثبت شد!");
                    break;

                case "country":
                    mv.addObject("message", "کشور سازنده با موفقیت ثبت شد!");
                    break;

                case "banner":
                    mv.addObject("message", "بنر با موفقیت ثبت شد!");
                    break;

                    case "notBanner":
                    mv.addObject("message", "نام بنر تکراری است!");
                    break;
                default:
                    break;
            }
        }

        return mv;

    }


    @RequestMapping("/{id}/product")
    public ModelAndView manageProductEdit(@PathVariable int id) {

        ModelAndView mv = new ModelAndView("page");
        mv.addObject("title", "Product Management");
        mv.addObject("userClickManageProduct", true);
        mv.addObject("categories", categoryListMapAll);


        // Product nProduct = new Product();
        mv.addObject("product", productDAO.get(id));


        return mv;

    }


    @RequestMapping(value = "/product", method = RequestMethod.POST)
    public String managePostProduct(@Valid @ModelAttribute("product") Product mProduct,
                                    BindingResult results, Model model, HttpServletRequest request) {


        // mandatory file upload check
        if (mProduct.getId() == 0) {
            new ProductValidator().validate(mProduct.getFile().get(0), results);
        } else {
            // edit check only when the file has been selected

            if (!mProduct.getFile().get(0).getOriginalFilename().equals("")) {
                new ProductValidator().validate(mProduct.getFile().get(0), results);
            }

        }

        if (results.hasErrors()) {
            model.addAttribute("message", "خطا در تصاویر ارسالی");
            model.addAttribute("userClickManageProduct", true);
            model.addAttribute("categories", categoryListMapAll);
            return "page";
        }
        //set the product images count
        mProduct.setImagesCount(mProduct.getFile().size());
        int Year = Calendar.getInstance().get(Calendar.YEAR);
        int Month = Calendar.getInstance().get(Calendar.MONTH);
        int Day = Calendar.getInstance().get(Calendar.DAY_OF_MONTH);
        mProduct.setLastUpdate(JalaliCalender.gregorianToJalali(new JalaliCalender.YearMonthDate(Year, Month, Day)).toString());


        if (mProduct.getId() == 0) {
            productDAO.add(mProduct);
        } else {
            productDAO.update(mProduct);
        }
        int i = 0;
        //upload the file
        for (MultipartFile file :
                mProduct.getFile()) {
            if (!file.getOriginalFilename().equals("")) {
                FileUtil.uploadFile(request, file, mProduct.getCode(), i);
                i++;
            }
        }

        return "redirect:/manage/product?success=product";
    }

    @RequestMapping(value = "/admin/dashboard")
    public ModelAndView adminDashboard() {
        ModelAndView mv = new ModelAndView("page");
        mv.addObject("userClickAdminDashboard", true);
        mv.addObject("title", "adminDashboard");
        return mv;
    }

    @RequestMapping(value = "/admin/orderDetail/update", method = RequestMethod.POST)
    public ModelAndView adminUpdateOrderDashboard(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("page");
        mv.addObject("userClickAdminDashboard", true);
        int id = Integer.valueOf(request.getParameter("id"));
        String orderPostalCode = request.getParameter("orderPostalCode");
        cartLineDAO.updateOrderPostalCode(orderPostalCode, id);
        mv.addObject("title", "adminDashboard");
        return mv;
    }


    @RequestMapping(value = "/product/{id}/activation", method = RequestMethod.GET)
    @ResponseBody
    public String managePostProductActivation(@PathVariable int id) {
        Product product = productDAO.get(id);
        boolean isActive = product.isActive();
        product.setActive(!isActive);
        productDAO.update(product);
        return (isActive) ? "محصول با موفقیت غیر فعال شد!" : "محصول با موفقیت  فعال شد";
    }

    @RequestMapping(value = "/orderDetail/{id}/activation", method = RequestMethod.GET)
    @ResponseBody
    public String managePostOrderDetailActivation(@PathVariable int id) {
        OrderDetail orderDetail = cartLineDAO.getOrderDetailForActivate(id);
        boolean isStatus = orderDetail.isStatus();
        orderDetail.setStatus(!isStatus);
        cartLineDAO.updateOrderDetail(orderDetail);
        return (isStatus) ? "سفارش غیرفعال شد!" : "سفارش با موفقیت تایید شد!";
    }

    @RequestMapping(value = "/rate/{id}/activation", method = RequestMethod.GET)
    @ResponseBody
    public String managePostRateActivation(@PathVariable int id) {
        Rates rates = productDetailsDAO.getRate(id);
        boolean isActive = rates.isActive();
        Product product = productDAO.get(rates.getProductId());
        product.setRateCount(product.getRateCount() + 1);
        product.setProductScore((product.getProductScore() + rates.getRateNumber()) / product.getRateCount());
        productDAO.update(product);
        rates.setActive(!isActive);
        productDetailsDAO.updateRate(rates);
        return (isActive) ? "نظر داده شده غیر فعال شد!" : "نظر با موفقت فعال شد!";
    }

    @RequestMapping(value = "/category", method = RequestMethod.POST)
    public String managePostCategory(@ModelAttribute("category") Category mCategory, HttpServletRequest request,
                                     BindingResult results) {

        if (!mCategory.getFile().get(0).getOriginalFilename().equals("")) {
            new ProductValidator().validate(mCategory.getFile().get(0), results);
        }

        mCategory.setImagesCount(mCategory.getFile().size());
        int i = 0;
        //upload the file
        for (MultipartFile file :
                mCategory.getFile()) {
            if (!file.getOriginalFilename().equals("")) {
                FileUtil.uploadFile(request, file, mCategory.getCode(), i);
                i++;
            }
        }

        categoryDAO.add(mCategory);
        return "redirect:" + request.getHeader("Referer") + "?success=category";
    }

    @RequestMapping(value = "/subCategory", method = RequestMethod.POST)
    public String managePostSubCategory(@ModelAttribute("subCategory") SubCategory mSubCategory, HttpServletRequest request) {
        categoryDAO.addSubCategory(mSubCategory);
        return "redirect:" + request.getHeader("Referer") + "?success=subCategory";
    }

    @RequestMapping(value = "/warranty", method = RequestMethod.POST)
    public String managePostWarranty(@ModelAttribute("warranty") Warranty mWarranty, HttpServletRequest request) {
        productDAO.addWarranty(mWarranty);
        return "redirect:" + request.getHeader("Referer") + "?success=warranty";
    }

    @RequestMapping(value = "/species", method = RequestMethod.POST)
    public String managePostSpecies(@ModelAttribute("species") Species mSpecies, HttpServletRequest request) {
        productDAO.addSpecies(mSpecies);
        return "redirect:" + request.getHeader("Referer") + "?success=species";
    }

    @RequestMapping(value = "/brand", method = RequestMethod.POST)
    public String managePostBrand(@ModelAttribute("brand") Brand mBrand, HttpServletRequest request) {


            int i = 0;
            //upload the file
            MultipartFile file=mBrand.getImage();

            if (!file.getOriginalFilename().equals("")) {
                FileUtil.uploadFile(request, file, mBrand.getName(), i);
            }
            productDAO.addBrand(mBrand);

            return "redirect:" + request.getHeader("Referer") + "?success=banner";

    }

    @RequestMapping(value = "/country", method = RequestMethod.POST)
    public String managePostCountry(@ModelAttribute("country") Country mCountry, HttpServletRequest request) {
        productDetailsDAO.addCountry(mCountry);
        return "redirect:" + request.getHeader("Referer") + "?success=country";
    }

    @RequestMapping(value = "/banner", method = RequestMethod.POST)
    public String managePostBanner(@ModelAttribute("banners") Banners mBanners, HttpServletRequest request) {
        if (productDetailsDAO.checkBannerName(mBanners.getName()) == null) {
            productDetailsDAO.addBanner(mBanners);
            int i = 0;
            //upload the file
            MultipartFile file=mBanners.getImage();

                if (!file.getOriginalFilename().equals("")) {
                    FileUtil.uploadFile(request, file, mBanners.getName(), i);
                }

            return "redirect:" + request.getHeader("Referer") + "?success=banner";
        }else
        {
            return "redirect:" + request.getHeader("Referer") + "?success=notBanner";
        }

    }


    @ModelAttribute("mainCategories")
    public List<Category> modelCategories() {
        return categoryDAO.list();
    }

    @ModelAttribute("category")
    public Category modelCategory() {
        return new Category();
    }

    @ModelAttribute("subCategory")
    public SubCategory modelSubCategory() {
        return new SubCategory();
    }

    @ModelAttribute("subCategories")
    public List<SubCategory> modelSubCategories() {
        return categoryDAO.listSubs();
    }

    @ModelAttribute("warranties")
    public List<Warranty> modelWarranties() {
        return productDAO.ListWarranties();
    }

    @ModelAttribute("warranty")
    public Warranty modelNewWarranty() {
        return new Warranty();
    }

    @ModelAttribute("species")
    public Species modelSpecies() {
        return new Species();
    }

    @ModelAttribute("brand")
    public Brand modelBrand() {
        return new Brand();
    }

    @ModelAttribute("brands")
    public List<Brand> modelBrands() {
        return productDAO.brandsList();
    }

    @ModelAttribute("country")
    public Country modelCountry() {
        return new Country();
    }

    @ModelAttribute("countries")
    public List<Country> modelCountries() {
        return productDetailsDAO.ListCountries();
    }

    @ModelAttribute("banners")
    public Banners modelBanners() {
        return new Banners();
    }


}

	
