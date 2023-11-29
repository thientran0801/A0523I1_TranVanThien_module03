package com.example.javawebcurrencyconverter;

import jakarta.servlet.Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Convert", value = "/convert")
public class Convert extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doPost(req, resp);
        float rate = Float.parseFloat(req.getParameter("rate"));
        float usd = Float.parseFloat(req.getParameter("usd"));

        float vnd = rate*usd;

        PrintWriter writer = resp.getWriter();
        writer.println("<html");
        writer.println("<body>");
        writer.println("<h1>Rate: "+ rate + "</h1>");
        writer.println("<h1>Rate: "+ rate + "</h1>");
        writer.println("<h1>Rate: "+ rate + "</h1>");
        writer.println("<h1>Usd: "+ usd + "</h1>");
        writer.println("<h1>VND: "+ vnd + "</h1>");
        writer.println("</body");
        writer.println("</html");
    }

}
