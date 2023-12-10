package com.casestudy.module2_accountname_wbe.model.service;

public class RentType {
    private int id;
    private String rentType;

    public RentType(int id, String rentType) {
        this.id = id;
        this.rentType = rentType;
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
}
