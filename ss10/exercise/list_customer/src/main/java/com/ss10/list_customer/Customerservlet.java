package com.ss10.list_customer;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "Customerservlet", value = "/Customer-servlet")
public class Customerservlet extends HttpServlet {

    private static final List<Customer> CUSTOMER_LIST = new ArrayList<>();
    static {
        CUSTOMER_LIST.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0xbl2Vwjca_WRVfnF86mg_khbEWbKJM52PQ&usqp=CAU"));
        CUSTOMER_LIST.add(new Customer("Nguyễn Văn Nam", "1983-08-21", "Bắc Giang","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0xbl2Vwjca_WRVfnF86mg_khbEWbKJM52PQ&usqp=CAU"));
        CUSTOMER_LIST.add(new Customer("Nguyễn Thái Hòa", "1983-08-22", "Nam Định","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0xbl2Vwjca_WRVfnF86mg_khbEWbKJM52PQ&usqp=CAU"));
        CUSTOMER_LIST.add(new Customer("Trần Đăng Khoa", "1983-08-17", "Hà Tây","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0xbl2Vwjca_WRVfnF86mg_khbEWbKJM52PQ&usqp=CAU"));
        CUSTOMER_LIST.add(new Customer("Nguyễn Đình Thi", "1983-08-19", "Hà Nội","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0xbl2Vwjca_WRVfnF86mg_khbEWbKJM52PQ&usqp=CAU"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("list", CUSTOMER_LIST);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/list-customer.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}


