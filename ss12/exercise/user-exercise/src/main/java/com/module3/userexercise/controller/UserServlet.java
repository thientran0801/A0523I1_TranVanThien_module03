package com.module3.userexercise.controller;

import com.module3.userexercise.dao.UserDAO;
import com.module3.userexercise.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/users")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                formCreate(request, response);
                break;
            case "delete":
                formDelete(request, response);
                break;
            case "update":
                formUpdate(request, response);
                break;
            case "findbyid":
                formSearchId(request, response);
                break;
            case "findbycountry":
                formSearchCountry(request, response);
                break;
            case "sort":
                sortByName(request, response);
            default:
                showList(request, response);
                break;
        }
    }

    private void formCreate(HttpServletRequest request, HttpServletResponse response) {
    }

    private void formDelete(HttpServletRequest request, HttpServletResponse response) {

    }

    private void formUpdate(HttpServletRequest request, HttpServletResponse response) {

    }

    private void formSearchId(HttpServletRequest request, HttpServletResponse response) {

    }

    private void formSearchCountry(HttpServletRequest request, HttpServletResponse response) {
    }

    private void sortByName(HttpServletRequest request, HttpServletResponse response) {
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<User> userList = userDAO.selectAll();
        request.setAttribute("list", userList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/list.jsp");
        try {
            dispatcher.forward(request, response);
            System.out.println("loi 1");
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("loi 2");

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
