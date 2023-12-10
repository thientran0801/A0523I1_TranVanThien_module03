package com.casestudy.module2_accountname_wbe.model.service;

public class ServiceType {
    private int id;
    private String serviceType;

    public ServiceType(int id, String serviceType) {
        this.id = id;
        this.serviceType = serviceType;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getServiceType() {
        return serviceType;
    }

    public void setServiceType(String serviceType) {
        this.serviceType = serviceType;
    }
}
