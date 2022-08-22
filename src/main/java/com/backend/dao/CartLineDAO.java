package com.backend.dao;

import com.backend.dto.Cart;
import com.backend.dto.CartLine;
import com.backend.dto.OrderDetail;
import com.backend.dto.OrderItem;

import java.util.List;

public interface CartLineDAO {

	public List<CartLine> list(int cartId);
	public CartLine get(int id);	
	public boolean add(CartLine cartLine);
	public boolean update(CartLine cartLine);
	public boolean remove(CartLine cartLine);
	
	// fetch the CartLine based on cartId and productId
	public CartLine getByCartAndProduct(int cartId, int productId);		
		
	// updating the cart
	boolean updateCart(Cart cart);
	
	// list of available cartLine
	public List<CartLine> listAvailable(int cartId);
	
	// adding order details
	boolean addOrderDetail(OrderDetail orderDetail);

	List<OrderDetail> getOrdersList(boolean status);


	OrderDetail getOrderDetailForActivate(int id);

	boolean updateOrderDetail(OrderDetail orderDetail);

	List<OrderItem> getOrderItemsByOrderDetail(int OrderDetailId);

	boolean updateOrderPostalCode(String postalCode,int id);

	List<OrderDetail> getUserOrdersList(int userId);
}
