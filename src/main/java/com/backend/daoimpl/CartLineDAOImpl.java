package com.backend.daoimpl;


import com.backend.dao.CartLineDAO;
import com.backend.dto.Cart;
import com.backend.dto.CartLine;
import com.backend.dto.OrderDetail;
import com.backend.dto.OrderItem;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository("cartLineDAO")
@Transactional
public class CartLineDAOImpl implements CartLineDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public CartLine getByCartAndProduct(int cartId, int productId) {
		String query = "FROM CartLine WHERE cartId = :cartId AND product.id = :productId";
		try {
			
			return sessionFactory.getCurrentSession()
									.createQuery(query,CartLine.class)
										.setParameter("cartId", cartId)
										.setParameter("productId", productId)
											.getSingleResult();
			
		}catch(Exception ex) {
			return null;	
		}
		
	}

	@Override
	public boolean add(CartLine cartLine) {
		try {
			sessionFactory.getCurrentSession().persist(cartLine);
			return true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean update(CartLine cartLine) {
		try {
			sessionFactory.getCurrentSession().update(cartLine);
			return true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean remove(CartLine cartLine) {	
		try {			
			sessionFactory.getCurrentSession().delete(cartLine);
			return true;
		}catch(Exception ex) {
			return false;
		}		
	}


	@Override
	public List<CartLine> list(int cartId) {
		String query = "FROM CartLine WHERE cartId = :cartId";
		return sessionFactory.getCurrentSession()
								.createQuery(query, CartLine.class)
									.setParameter("cartId", cartId)
										.getResultList();		
	}

	@Override
	public CartLine get(int id) {		
		return sessionFactory.getCurrentSession().get(CartLine.class, Integer.valueOf(id));
	}

	@Override
	public boolean updateCart(Cart cart) {
		try {			
			sessionFactory.getCurrentSession().update(cart);			
			return true;
		}
		catch(Exception ex) {
			return false;
		}
	}

	@Override
	public List<CartLine> listAvailable(int cartId) {
		String query = "FROM CartLine WHERE cartId = :cartId AND available = :available";
		return sessionFactory.getCurrentSession()
								.createQuery(query, CartLine.class)
									.setParameter("cartId", cartId)
									.setParameter("available", true)
										.getResultList();
	}

	@Override
	public boolean addOrderDetail(OrderDetail orderDetail) {
		try {			
			sessionFactory.getCurrentSession().persist(orderDetail);			
			return true;
		}
		catch(Exception ex) {
			return false;
		}
	}

	@Override
	public List<OrderDetail> getOrdersList(boolean status) {
		try {
			return sessionFactory.getCurrentSession().
					createQuery("from OrderDetail where status = :status")
					.setParameter("status",status)
					.getResultList();
		}catch (Exception ex)
		{
			ex.printStackTrace();
			return null;
		}

	}

	@Override
	public OrderDetail getOrderDetailForActivate(int id) {
		try {
			return sessionFactory.getCurrentSession().get(OrderDetail.class,Integer.valueOf(id));

		}catch (Exception ex)
		{
			ex.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean updateOrderDetail(OrderDetail orderDetail) {
		try {
			sessionFactory.getCurrentSession().update(orderDetail);
			return true;
		}catch (Exception ex)
		{
			ex.printStackTrace();
			return false;
		}
	}

	@Override
	public List<OrderItem> getOrderItemsByOrderDetail(int OrderDetailId) {
		try {
			return sessionFactory.getCurrentSession().createQuery("from OrderItem where orderDetail.id= :orderDetail", OrderItem.class)
					.setParameter("orderDetail",OrderDetailId)
					.getResultList();

		}catch (Exception ex)
		{
			ex.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean updateOrderPostalCode(String postalCode, int id) {
		try {
			sessionFactory.getCurrentSession().createQuery("update OrderDetail set orderPostalCode = :postalCode where id = :id")
					.setParameter("postalCode",postalCode)
					.setParameter("id",id).executeUpdate();
			return true;
		}catch (Exception ex)
		{
			ex.printStackTrace();
			return false;
		}

	}

	@Override
	public List<OrderDetail> getUserOrdersList(int userId) {
		try {
			return sessionFactory.getCurrentSession().createQuery("from OrderDetail where user.id= :userId", OrderDetail.class)
					.setParameter("userId",userId)
					.getResultList();

		}catch (Exception ex)
		{
			ex.printStackTrace();
			return null;
		}
	}

}
