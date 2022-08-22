package com.onlineshopping.controller;

import com.backend.dao.CartLineDAO;
import com.backend.dto.OrderDetail;
import com.onlineshopping.model.UserModel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/account/user")
public class UserController {

    @Autowired
    CartLineDAO cartLineDAO;

    @Autowired
    HttpSession session;

    @RequestMapping("/dashboard")
    public ModelAndView mv()
    {

        ModelAndView mv=new ModelAndView("page");
        mv.addObject("title", "user-account");
        mv.addObject("userClickUserAccount",true);
        return mv;

    }
    @RequestMapping("/orders")
    @ResponseBody
    public List<OrderDetail> getUserOrders()
    {

        UserModel userModel=(UserModel) session.getAttribute("userModel");
        int id=userModel.getId();
        return cartLineDAO.getUserOrdersList(id);
    }

}
