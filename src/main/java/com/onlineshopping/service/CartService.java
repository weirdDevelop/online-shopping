package com.onlineshopping.service;


import com.backend.dao.CartLineDAO;
import com.backend.dao.ProductDAO;
import com.backend.dto.Cart;
import com.backend.dto.CartLine;
import com.backend.dto.Product;
import com.onlineshopping.model.UserModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service("cartService")
public class CartService {

	@Autowired
	private CartLineDAO cartLineDAO;
	
	@Autowired
	private ProductDAO productDAO;
		
	@Autowired
	private HttpSession session;
	
	public List<CartLine> getCartLines() {

		return cartLineDAO.list(getCart().getId());

	}
	
	/* to update the cart count */
	public String manageCartLine(int cartLineId, int count) {
		
		CartLine cartLine = cartLineDAO.get(cartLineId);		

		double oldTotal = cartLine.getTotal();
		float oldWeight=cartLine.getWeight();

		
		Product product = cartLine.getProduct();
		
		// check if that much quantity is available or not
		if(product.getQuantity() < count) {
			return "result=unavailable";

		}

		cartLine.setWeight(product.getWeight() * count);

		// update the cart line
		cartLine.setProductCount(count);
		if(product.getDiscount()>0) {
			cartLine.setBuyingPrice(product.getUnitPrice() - (product.getUnitPrice()*product.getDiscount()/100));
			cartLine.setTotal(cartLine.getBuyingPrice() * count);

		}
		else
		{
			cartLine.setBuyingPrice(product.getUnitPrice());
			cartLine.setTotal(product.getUnitPrice() * count);

		}

		cartLineDAO.update(cartLine);

	
		// update the cart
		Cart cart = this.getCart();
		cart.setGrandTotal(cart.getGrandTotal() - oldTotal + cartLine.getTotal());
		cart.setWeight(cart.getWeight() - oldWeight + cartLine.getWeight());
		cartLineDAO.updateCart(cart);
		
		return "result=updated";
	}



	public String addCartLine(int productId) {		
		Cart cart = this.getCart();
		String response = null;
		CartLine cartLine = cartLineDAO.getByCartAndProduct(cart.getId(), productId);
		if(cartLine==null) {
			// add a new cartLine if a new product is getting added
			cartLine = new CartLine();
			Product product = productDAO.get(productId);
			// transfer the product details to cartLine
			cartLine.setCartId(cart.getId());
			cartLine.setProduct(product);
			cartLine.setProductCount(1);
			cartLine.setWeight(product.getWeight());
			if(product.getDiscount() >0)
			{
				cartLine.setBuyingPrice(product.getUnitPrice()-(product.getUnitPrice()*product.getDiscount()/100) );
				cartLine.setTotal(cartLine.getBuyingPrice());
			}else {
				cartLine.setBuyingPrice(product.getUnitPrice());
				cartLine.setTotal(product.getUnitPrice());
			}
			// insert a new cartLine
			cartLineDAO.add(cartLine);
			
			// update the cart
			cart.setGrandTotal(cart.getGrandTotal() + cartLine.getTotal());
			cart.setWeight(cart.getWeight() + cartLine.getWeight());
			cart.setCartLines(cart.getCartLines() + 1);
			cartLineDAO.updateCart(cart);

			response = "result=added";						
		} 
		else {
			// check if the cartLine has been already reached to maximum count
			if(cartLine.getProductCount() < 3) {
				// call the manageCartLine method to increase the count
				response = this.manageCartLine(cartLine.getId(), cartLine.getProductCount() + 1);				
			}			
			else {				
				response = "result=maximum";				
			}						
		}		
		return response;
	}
	
	private Cart getCart() {
		return ((UserModel)session.getAttribute("userModel")).getCart();
	}


	public String removeCartLine(int cartLineId) {
		
		CartLine cartLine = cartLineDAO.get(cartLineId);
		// deduct the cart
		// update the cart
		Cart cart = this.getCart();	
		cart.setGrandTotal(cart.getGrandTotal() - cartLine.getTotal());
		cart.setWeight(cart.getWeight()-cartLine.getWeight());
		cart.setCartLines(cart.getCartLines() - 1);		
		cartLineDAO.updateCart(cart);
		
		// remove the cartLine
		cartLineDAO.remove(cartLine);
				
		return "result=deleted";
	}


	public String validateCartLine() {
		Cart cart = this.getCart();
		List<CartLine> cartLines = cartLineDAO.list(cart.getId());
		double grandTotal = 0.0;
		float weight=0.0f;
		int lineCount = 0;
		String response = "result=success";
		boolean changed = false;
		Product product = null;
		for(CartLine cartLine : cartLines) {					
			product = cartLine.getProduct();
			changed = false;
			// check if the product is active or not
			// if it is not active make the availability of cartLine as false
			if((!product.isActive() && product.getQuantity() == 0) && cartLine.isAvailable()) {
				cartLine.setAvailable(false);
				changed = true;
			}			
			// check if the cartLine is not available
			// check whether the product is active and has at least one quantity available
			if((product.isActive() && product.getQuantity() > 0) && !(cartLine.isAvailable())) {
					cartLine.setAvailable(true);
					changed = true;
			}
			
			// check if the buying price of product has been changed
			if(cartLine.getBuyingPrice() != product.getUnitPrice()) {
				if(product.getDiscount()>0)
				{
					if(!(cartLine.getBuyingPrice()==product.getUnitPrice() - product.getUnitPrice()*product.getDiscount()/100))
					{
						cartLine.setBuyingPrice(product.getUnitPrice() - product.getUnitPrice()*product.getDiscount()/100);
						cartLine.setTotal(cartLine.getProductCount() * cartLine.getBuyingPrice());
						changed = true;
					}
				}else {
					// set the buying price to the new price
					cartLine.setBuyingPrice(product.getUnitPrice());
					// calculate and set the new total
					cartLine.setTotal(cartLine.getProductCount() * product.getUnitPrice());
					changed = true;
				}
			}
			
			// check if that much quantity of product is available or not
			if(cartLine.getProductCount() > product.getQuantity()) {
				cartLine.setProductCount(product.getQuantity());										
				cartLine.setTotal(cartLine.getProductCount() * product.getUnitPrice());
				cartLine.setWeight(cartLine.getProductCount() * product.getWeight());
				changed = true;
				
			}
			
			// changes has happened
			if(changed) {				
				//update the cartLine
				cartLineDAO.update(cartLine);
				// set the result as modified
				response = "result=modified";
			}

			grandTotal += cartLine.getTotal();
			weight +=cartLine.getWeight();
			lineCount++;
		}
		
		cart.setCartLines(lineCount++);
		cart.setGrandTotal(grandTotal);
		cart.setWeight(weight);
		cartLineDAO.updateCart(cart);

		return response;
	}	
}
