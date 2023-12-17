package com.example.ontap1.controller;

import com.example.ontap1.model.Customer;
import com.example.ontap1.model.CustomerDTO;
import com.example.ontap1.model.CustomerType;
import com.example.ontap1.repository.CustomerRepository;
import com.example.ontap1.repository.CustomerTypeRepository;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/CustomerServlet")
public class CustomerServlet extends HttpServlet {

    private CustomerRepository customerRepository = new CustomerRepository();
    private CustomerTypeRepository customerTypeRepository = new CustomerTypeRepository();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action;
        action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "createCustomer":
                showFormCreate(request, response);
                break;
            case "editCustomer":
                showFormEdit(request,response);
                break;
            case "deleteCustomer":
                showFormDelete(request,response);
                break;
            default:
                showListCustomer(request, response);
                break;
        }
    }

    private void showFormDelete(HttpServletRequest request, HttpServletResponse response) {
        CustomerDTO customerDTO = customerRepository.findById(Integer.parseInt(request.getParameter("id")));
        request.setAttribute("customer", customerDTO);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/delete_customer.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormEdit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        List<CustomerType> list = customerTypeRepository.showList();
        CustomerDTO customerDTO = customerRepository.findById(id);
        request.setAttribute("list", list);
        request.setAttribute("customer", customerDTO);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/edit_customer.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        List<CustomerType> customerTypes = customerTypeRepository.showList();
        for (CustomerType c : customerTypes) {
        }
        request.setAttribute("customerTypes", customerTypes);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/create_customer.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showListCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<CustomerDTO> list = customerRepository.showList();
        request.setAttribute("list", list);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/list_customer.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "createCustomer":
                createCustomer(request, response);
                break;
            case "editCustomer":
                updateCustomer(request, response);
                break;
            case "deleteCustomer":
                deleteCustomer(request, response);
                break;
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        customerRepository.delete(id);
        try {
            response.sendRedirect("/CustomerServlet");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int typeID = Integer.parseInt(request.getParameter("typeCustomer"));
        String dob = request.getParameter("dob");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String idcard = request.getParameter("idcard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Customer customer = new Customer(id,name, typeID, dob, gender, idcard, phone, email, address);
        customerRepository.update(customer);
        try {
            response.sendRedirect("/CustomerServlet");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        int typeID = Integer.parseInt(request.getParameter("typeID"));
        String dob = request.getParameter("dob");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String idcard = request.getParameter("idcard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Customer customer = new Customer(name, typeID, dob, gender, idcard, phone, email, address);
        customerRepository.add(customer);
        try {
            response.sendRedirect("/CustomerServlet");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
