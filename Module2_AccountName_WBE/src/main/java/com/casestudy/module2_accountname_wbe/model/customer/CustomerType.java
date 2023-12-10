package com.casestudy.module2_accountname_wbe.model.customer;

public class CustomerType {
    private int id;
    private String customerType;

    public CustomerType(int id, String customerType) {
        this.id = id;
        this.customerType = customerType;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCustomerType() {
        return customerType;
    }

    public void setCustomerType(String customerType) {
        this.customerType = customerType;
    }
}
