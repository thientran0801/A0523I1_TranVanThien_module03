package com.casestudy.module2_accountname_wbe.model.service;

public class RentType {
    private int id;
    private String rentType;
    private double costType;

    public RentType(int id, String rentType, double costType) {
        this.id = id;
        this.rentType = rentType;
        this.costType = costType;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRentType() {
        return rentType;
    }

    public void setRentType(String rentType) {
        this.rentType = rentType;
    }

    public double getCostType() {
        return costType;
    }

    public void setCostType(double costType) {
        this.costType = costType;
    }
}
