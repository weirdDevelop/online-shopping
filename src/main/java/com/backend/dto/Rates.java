package com.backend.dto;

import javax.persistence.*;
import java.io.Serializable;

@Entity
public class Rates implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private int userId;
    @Column(name="user_email")
    private String userEmail;
    private String description;
    @Column(name = "rate_number")
    private float rateNumber;
    @Column(name = "user_name")
    private String userName;
    @Column(name = "product_id")
    private int productId;
    private boolean active;
    private byte suggestion;
    private String timeSent;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getRateNumber() {
        return rateNumber;
    }

    public void setRateNumber(float rateNumber) {
        this.rateNumber = rateNumber;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getProductId() {
        return productId;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public byte getSuggestion() {
        return suggestion;
    }
    public void setSuggestion(byte suggestion) {
        this.suggestion = suggestion;
    }

    public String getTimeSent() {
        return timeSent;
    }

    public void setTimeSent(String timeSent) {
        this.timeSent = timeSent;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "Rates{" +
                "id=" + id +
                ", userId=" + userId +
                ", userEmail='" + userEmail + '\'' +
                ", description='" + description + '\'' +
                ", rateNumber=" + rateNumber +
                ", userName='" + userName + '\'' +
                ", productId=" + productId +
                ", active=" + active +
                ", suggestion=" + suggestion +
                ", timeSent='" + timeSent + '\'' +
                '}';
    }
}
