package com.onlineshopping.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

import java.io.PrintWriter;
import java.io.StringWriter;

@ControllerAdvice
public class GlobalDefaultExceptionHandler {

	
	@ExceptionHandler(NoHandlerFoundException.class)
	public ModelAndView handlerNoHandlerFoundException() {
		
		ModelAndView mv = new ModelAndView("error");
		
		mv.addObject("errorTitle", "صفحه ای وجود ندارد!");
		
		mv.addObject("errorDescription", "خظای 404! این صفحه وجود ندارد!");
		
		mv.addObject("title", "404 Error Page");

		mv.addObject("userError",true);
		
		return mv;
	}
	
	
	@ExceptionHandler(ProductNotFoundException.class)
	public ModelAndView handlerProductNotFoundException() {
		
		ModelAndView mv = new ModelAndView("error");
		
		mv.addObject("errorTitle", "کالا مدنظر شما وجود ندارد!");
		
		mv.addObject("errorDescription", "کالای جستجو شده وجود ندارد");
		
		mv.addObject("title", "Product Unavailable");

		mv.addObject("userError",true);
		
		return mv;
	}
		
	
	@ExceptionHandler(Exception.class)
	public ModelAndView handlerException(Exception ex) {
		
		ModelAndView mv = new ModelAndView("error");
		
		mv.addObject("errorTitle", "با مدیریت سایت تماس بگیرید!");
		
		
		/* only for debugging application*/
		StringWriter sw = new StringWriter();
		PrintWriter pw = new PrintWriter(sw);
		
		ex.printStackTrace(pw);
						
		mv.addObject("errorDescription", sw.toString());
		
		mv.addObject("title", "Error");

		mv.addObject("userError",true);
		
		return mv;
	}
			
	
}
