package com.example.product_discount_calculator;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;

@WebServlet(name = "DiscountServlet", value = "/display-discount")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String des = request.getParameter("description");
        float pri = Float.parseFloat(request.getParameter("price"));
        float per = Float.parseFloat(request.getParameter("percent"));

        float amount = (float) (pri * per * 0.01);

        float price_after = pri - amount;

        PrintWriter writer = response.getWriter();
        writer.println("<!DOCTYPE html>\n" +
                "<html lang=\"en\">\n" +
                "<head>\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <title>Title</title>\n" +
                "</head>\n" +
                "<body>\n" +
                "<p>Product Description: <span>" +des+
                "</span></p>\n" +

                "<p>List Price: <span>" +pri+
                "</span></p>\n" +

                "<p>Discount Percent: <span>" +per+
                "</span></p>\n" +

                "<hr>\n" +
                "<p>Discount Amount: <span>" +amount+
                "</span></p>\n" +

                "<h3>Discount Price: <span>" +price_after+
                "</span></h3>\n" +

                "</body>\n" +
                "</html>");
    }
}
