package com.backend.dto;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "order_detail")
public class OrderDetail implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@ManyToOne
	@JoinColumn(name = "user_id")

	private User user;
	@Column(name = "order_total")
	private double orderTotal;
	@ManyToOne
	private Address shipping;
	@ManyToOne
	@JsonIgnore
	private Address billing;
	@OneToMany(mappedBy="orderDetail", fetch = FetchType.EAGER, cascade = CascadeType.ALL)

	private List<OrderItem> orderItems = new ArrayList<>();
	
	@Column(name = "order_count")
	private int orderCount;
	
	@Column(name="order_date")
	private String orderDate;

	private boolean status;

	@Column(name ="order_postal_Code" )
	private String orderPostalCode;

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public int getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public double getOrderTotal() {
		return orderTotal;
	}
	public void setOrderTotal(double orderTotal) {
		this.orderTotal = orderTotal;
	}
	public Address getShipping() {
		return shipping;
	}
	public void setShipping(Address shipping) {
		this.shipping = shipping;
	}
	public Address getBilling() {
		return billing;
	}
	public void setBilling(Address billing) {
		this.billing = billing;
	}
	public List<OrderItem> getOrderItems() {
		return orderItems;
	}
	public void setOrderItems(List<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getOrderPostalCode() {
		return orderPostalCode;
	}

	public void setOrderPostalCode(String orderPostalCode) {
		this.orderPostalCode = orderPostalCode;
	}

	@Override
	public String toString() {
		return "OrderDetail{" +
				"id=" + id +
				", user=" + user +
				", orderTotal=" + orderTotal +
				", shipping=" + shipping +
				", billing=" + billing +
				", orderItems=" + orderItems +
				", orderCount=" + orderCount +
				", orderDate=" + orderDate +
				", status=" + status +
				", orderPostalCode='" + orderPostalCode + '\'' +
				'}';
	}
}
