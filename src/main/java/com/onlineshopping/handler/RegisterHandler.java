package com.onlineshopping.handler;


import com.backend.dao.ProductDetailsDAO;
import com.backend.dao.UserDAO;
import com.backend.dto.*;
import com.onlineshopping.model.RegisterModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


@Component

public class RegisterHandler {


    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private ProductDetailsDAO productDetailsDAO;


    @Autowired
    private UserDAO userDAO;

    public RegisterModel init() {
        return new RegisterModel();
    }

    public void addUser(RegisterModel registerModel, User user) {
        registerModel.setUser(user);
    }

    public void addBilling(RegisterModel registerModel, Address billing) {
        registerModel.setBilling(billing);
    }

    public String validateUser(User user, MessageContext error) {
        String transitionValue = "success";
        String regex="^(\\+98|0)?9\\d{9}$";
        Pattern pattern=Pattern.compile(regex);
        Matcher matcher=pattern.matcher(user.getContactNumber());

        if (!user.getPassword().equals(user.getConfirmPassword())) {
            error.addMessage(new MessageBuilder().error().source(
                    "confirmPassword").defaultText("رمز شما با تکرار ان انطباق ندارد").build());
            transitionValue = "failure";
        }
        if (userDAO.getByEmail(user.getEmail()) != null) {
            error.addMessage(new MessageBuilder().error().source(
                    "email").defaultText("ادرس ایمیل(نام کاربری) شما قبلا استفاده شده است!").build());
            transitionValue = "failure";
        }if(!user.isAccepted())
        {
            error.addMessage(new MessageBuilder().error().source(
                    "accepted").defaultText("شرایط و مقررات باید مورد پذیرش قرار گیرند!").build());
            transitionValue = "failure";

        }if(!matcher.matches())
        {
            error.addMessage(new MessageBuilder().error().source(
                    "contactNumber").defaultText("شماره تلفن در ایران معتبر نیست!").build());
            transitionValue = "failure";
        }

        return transitionValue;
    }

    public String saveAll(RegisterModel registerModel) {
        String transitionValue = "success";
        User user = registerModel.getUser();
        user.setRole("USER");
        if (user.getRole().equals("USER")) {
            // create a new cart
            Cart cart = new Cart();
            cart.setUser(user);
            user.setCart(cart);
        }

        // encode the password
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        // save the user

        userDAO.add(user);
        // save the billing address
        Address billing = registerModel.getBilling();
        billing.setUserId(user.getId());
        billing.setBilling(true);
        userDAO.addAddress(billing);
        return transitionValue;
    }

    @ModelAttribute("provinces")
    public List<Province> modelProvinces() {
        return productDetailsDAO.ListProvincies();
    }

    @ModelAttribute("cities")
    public List<City> modelCities() {
        return productDetailsDAO.ListCities();
    }

}
