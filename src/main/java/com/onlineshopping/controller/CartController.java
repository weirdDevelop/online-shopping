package com.onlineshopping.controller;


import com.onlineshopping.service.CartService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/cart")
public class CartController {

	private final static Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@Autowired
	private CartService cartService;
	@RequestMapping("/show")
	public ModelAndView showCart(@RequestParam(name = "result", required = false) String result) {
		
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Shopping Cart");
		mv.addObject("userClickShowCart", true);
		
		if(result!=null) {
			switch(result) {
				case "added":
					mv.addObject("message", "کالا با موفقیت به سبد خرید اضافه شد!");
					cartService.validateCartLine();
					break;
				case "unavailable":
					mv.addObject("message", "موجودی کالا نا کافی است!");
					break;
				case "updated":
					mv.addObject("message", "سبد خرید به روزرسانی شد!");
					cartService.validateCartLine();
					break;
				case "modified":
					mv.addObject("message", "آیتم مدنظر به روز رسانی شد!");
					break;
				case "maximum":
					mv.addObject("message", "تعداد درخواست بیشتر از حداکثر مجاز است!");
					break;
				case "deleted":
					mv.addObject("message", "آیتم با موفقیت حذف شد!");
					break;

			}
		}
		else {
			String response = cartService.validateCartLine();
			if(response.equals("result=modified")) {
				mv.addObject("message", "یک یا چند آیتم در سبد تغییر کرد!");
			}
		}

		mv.addObject("cartLines", cartService.getCartLines());
		return mv;
		
	}
	

	@RequestMapping("/{cartLineId}/update")
	public String updateCartLine(@PathVariable int cartLineId, @RequestParam int count) {
		String response = cartService.manageCartLine(cartLineId, count);		
		return "redirect:/cart/show?"+response;		
	}
	
	@RequestMapping("/add/{productId}/product")
	public String addCartLine(@PathVariable int productId) {
		String response = cartService.addCartLine(productId);
		return "redirect:/cart/show?"+response;
	}
	
	@RequestMapping("/{cartLineId}/remove")
	public String removeCartLine(@PathVariable int cartLineId) {
		String response = cartService.removeCartLine(cartLineId);
		return "redirect:/cart/show?"+response;
	}
	
	/* after validating it redirect to checkout
	 * if result received is success proceed to checkout 
	 * else display the message to the user about the changes in cart page
	 * */	
	@RequestMapping("/validate")
	public String validateCart() {	
		String response = cartService.validateCartLine();
		if(!response.equals("result=success")) {
			return "redirect:/cart/show?"+response;
		}
		else {
			return "redirect:/cart/checkout";
		}
	}


}
