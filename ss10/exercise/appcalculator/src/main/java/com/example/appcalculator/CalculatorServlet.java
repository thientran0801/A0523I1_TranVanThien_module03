package com.example.appcalculator;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Calculator;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;

@WebServlet(name = "CalculatorServlet", value = "/calculate")
public class CalculatorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float first = Float.parseFloat(request.getParameter("first-operand"));
        float second = Float.parseFloat(request.getParameter("second-operand"));
        char operator = request.getParameter("operator").charAt(0);

        PrintWriter printWriter = response.getWriter();
        printWriter.println("<html>");
        printWriter.println("<body>");
        printWriter.println("<h1>");
        printWriter.println("Result: ");
        printWriter.println("</h1>");
        try {
            float result = Calculator.calculator(first, second, operator);

            printWriter.println(first + " " + operator + " " + second + " = " + result);
        }catch (Exception e) {
            printWriter.println("Error: " +e.getMessage());
        }
        printWriter.println("</body>");
        printWriter.println("</html>");
    }
}
