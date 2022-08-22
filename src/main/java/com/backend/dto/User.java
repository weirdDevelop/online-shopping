package com.backend.dto;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.io.Serializable;

@Entity
@Table(name = "user_detail")
public class User implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@NotBlank(message = "لطفا نام خود را وارد کنید")
	@Column(name = "first_name")
	private String firstName;
	@NotBlank(message = "لطفا نام خانوادگی خود را وارد کنید")
	@Column(name = "last_name")
	private String lastName;
	@NotBlank(message = "لطفا ادرس ایمیل خود را وارد کنید")
	@JsonIgnore
	private String email;
	@NotBlank(message = "لطفا شماره تلفن خود را وارد کنید")
	@Column(name = "contact_number")
	private String contactNumber;
	@JsonIgnore
	private String role;
	@NotBlank(message = "لطفا پسورد خود را وارد کنید")
	@JsonIgnore
	@Size(min = 8,message = "حداقل 8 کاراکتر باشد")
	private String password;
	private boolean enabled = true;
	@Transient
	@JsonIgnore
	private String confirmPassword;

	@Transient
	@JsonIgnore
	private boolean accepted=false;



	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public boolean isAccepted() {
		return accepted;
	}

	public void setAccepted(boolean accepted) {
		this.accepted = accepted;
	}

	@JsonIgnore
	@OneToOne(mappedBy="user", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private Cart cart;
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}

	@Override
	public String toString() {
		return "User{" +
				"id=" + id +
				", firstName='" + firstName + '\'' +
				", lastName='" + lastName + '\'' +
				", email='" + email + '\'' +
				", contactNumber='" + contactNumber + '\'' +
				", role='" + role + '\'' +
				", password='" + password + '\'' +
				", enabled=" + enabled +
				", confirmPassword='" + confirmPassword + '\'' +
				", accepted=" + accepted +
				", cart=" + cart +
				'}';
	}
}
