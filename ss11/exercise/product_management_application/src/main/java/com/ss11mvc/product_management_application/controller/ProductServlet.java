package com.ss11mvc.product_management_application.controller;

import com.ss11mvc.product_management_application.model.Product;
import com.ss11mvc.product_management_application.service.ProductService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/product")
public class ProductServlet extends HttpServlet {
    private ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormCreate(request, response);
                break;
            case "delete":
                showFormdelete(request, response);
                break;
            case "edit":
                showFormupdate(request, response);
                break;
            case "view":
                showView(request, response);
                break;
            case "find":
                showFormFind(request, response);
                break;
            default:
                showList(request, response);
                break;
        }
    }

    private void showFormFind(HttpServletRequest request, HttpServletResponse response) {
    }

    private void showView(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        request.setAttribute("product", product);
        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = request.getRequestDispatcher("product/error.jsp");
        }else {
            dispatcher = request.getRequestDispatcher("product/view_detail.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
               e.printStackTrace();
            }
        }
    }

    private void showFormupdate(HttpServletRequest request, HttpServletResponse response) {
    }

    private void showFormdelete(HttpServletRequest request, HttpServletResponse response) {
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = this.productService.showList();
        request.setAttribute("list", productList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/list.jsp");
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
            case "create":
                createProduct(request, response);
                break;
            case "delete":
                showFormdelete(request, response);
                break;
            case "edit":
                showFormupdate(request, response);
                break;
            case "view":
                showView(request, response);
                break;
            case "find":
                showFormFind(request, response);
                break;
            default:
                showList(request, response);
                break;
        }
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) {

    }
}
