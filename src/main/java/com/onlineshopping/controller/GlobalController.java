package com.onlineshopping.controller;


import com.backend.dao.CartLineDAO;
import com.backend.dao.UserDAO;
import com.backend.dto.User;
import com.onlineshopping.model.UserModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpSession;

@ControllerAdvice
public class GlobalController {
	
	
	@Autowired
	private UserDAO userDAO;

	@Autowired
	private CartLineDAO cartLineDAO;
	
	@Autowired
	private HttpSession session;
	
	private UserModel userModel = null;
	private User user = null;
	
	
	@ModelAttribute("userModel")
	public UserModel getUserModel() {		
		if(session.getAttribute("userModel")==null) {
			// get the authentication object
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			
			
			if(!authentication.getPrincipal().equals("anonymousUser")){
				// get the user from the database
				user = userDAO.getByEmail(authentication.getName());
				
				if(user!=null) {
					// create a new model
					userModel = new UserModel();
					// set the name and the id
					userModel.setId(user.getId());
					userModel.setFullName(user.getFirstName() + " " + user.getLastName());
					userModel.setRole(user.getRole());
					userModel.setUserEmail(user.getEmail());
					if(user.getRole().equals("USER")) {
						userModel.setCart(user.getCart());
						userModel.setCartLines(cartLineDAO.list(user.getCart().getId()));
					}				
	
					session.setAttribute("userModel", userModel);
					return userModel;
				}			
			}
		}else {
			if (user.getRole().equals("USER")) {
				userModel.setCartLines(cartLineDAO.list(user.getCart().getId()));
			}
		}
		return (UserModel) session.getAttribute("userModel");		
	}
		
}
