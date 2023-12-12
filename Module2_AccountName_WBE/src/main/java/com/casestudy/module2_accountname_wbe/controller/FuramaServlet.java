package com.casestudy.module2_accountname_wbe.controller;

import com.casestudy.module2_accountname_wbe.model.customer.Customer;
import com.casestudy.module2_accountname_wbe.repository.CustomerRepository;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

@WebServlet(name = "FuramaServlet", value = "/furama")
public class FuramaServlet extends HttpServlet {

    private static CustomerRepository customerRepository = new CustomerRepository();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "lisCustomer":
                showListCustomer(request, response);
                break;
        }
    }

    private void showListCustomer(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        List<Customer> list = customerRepository.showList();
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

    }
}
