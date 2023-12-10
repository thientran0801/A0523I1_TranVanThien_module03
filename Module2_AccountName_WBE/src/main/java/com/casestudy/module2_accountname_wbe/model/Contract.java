package com.casestudy.module2_accountname_wbe.model;

import com.casestudy.module2_accountname_wbe.model.customer.Customer;
import com.casestudy.module2_accountname_wbe.model.employee.Employee;
import com.casestudy.module2_accountname_wbe.model.service.Service;

public class Contract {
    private String id;
    private String startDate;
    private String EndDate;
    private double deposit;
    private double totalMoney;
    private Customer customer;
    private Employee employee;
    private Service service;

    public Contract(String startDate, String endDate, double deposit, double totalMoney, Customer customer, Employee employee, Service service) {
        this.startDate = startDate;
        EndDate = endDate;
        this.deposit = deposit;
        this.totalMoney = totalMoney;
        this.customer = customer;
        this.employee = employee;
        this.service = service;
    }

    public Contract(String id, String startDate, String endDate, double deposit, double totalMoney, Customer customer, Employee employee, Service service) {
        this.id = id;
        this.startDate = startDate;
        EndDate = endDate;
        this.deposit = deposit;
        this.totalMoney = totalMoney;
        this.customer = customer;
        this.employee = employee;
        this.service = service;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return EndDate;
    }

    public void setEndDate(String endDate) {
        EndDate = endDate;
    }

    public double getDeposit() {
        return deposit;
    }

    public void setDeposit(double deposit) {
        this.deposit = deposit;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }
}
