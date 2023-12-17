package com.casestudy.module2_accountname_wbe.controller;

import com.casestudy.module2_accountname_wbe.model.customer.Customer;
import com.casestudy.module2_accountname_wbe.model.customer.CustomerType;
import com.casestudy.module2_accountname_wbe.model.employee.*;
import com.casestudy.module2_accountname_wbe.model.service.RentType;
import com.casestudy.module2_accountname_wbe.model.service.Service;
import com.casestudy.module2_accountname_wbe.model.service.ServiceType;
import com.casestudy.module2_accountname_wbe.repository.customer.CustomerRepository;
import com.casestudy.module2_accountname_wbe.repository.customer.CustomerTypeRepository;
import com.casestudy.module2_accountname_wbe.repository.employee.*;
import com.casestudy.module2_accountname_wbe.repository.service.RentTypeRepository;
import com.casestudy.module2_accountname_wbe.repository.service.ServiceRepository;
import com.casestudy.module2_accountname_wbe.repository.service.ServiceTypeRepository;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

@WebServlet(name = "FuramaServlet", value = "/furama")
public class FuramaServlet extends HttpServlet {
    private static DivisionRepository divisionRepository = new DivisionRepository();
    private static PositionRepository positionRepository = new PositionRepository();
    private static UserRepository userRepository = new UserRepository();
    private static EducationDegreeRepository educationDegreeRepository = new EducationDegreeRepository();
    private static EmployeeRepository employeeRepository = new EmployeeRepository();
    private static CustomerRepository customerRepository = new CustomerRepository();
    private static CustomerTypeRepository customerTypeRepository = new CustomerTypeRepository();
    private static ServiceRepository serviceRepository = new ServiceRepository();
    private static RentTypeRepository rentTypeRepository = new RentTypeRepository();
    private static ServiceTypeRepository serviceTypeRepository = new ServiceTypeRepository();

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
            case "createCustomer":
                showFormCreateCustomer(request, response);
                break;
            case "editCustomer":
                showFormEditCustomer(request, response);
                break;
            case "deleteCustomer":
                showFormDeleteCustomer(request, response);
                break;

            //Service

            case "createService":
                showFormCreateService(request, response);
                break;
            case "listService":
                showListService(request, response);
                break;

            // employee
            case "createEmployee":
                showFormCreateEmployee(request, response);
                break;
            case "listEmployee":
                listEmployee(request, response);
                break;
            case "editEmployee":
                showFormEditEmployee(request, response);
                break;
            case "deleteEmployee":
                showFormDeleteEmployee(request, response);
                break;
        }
    }

    private void showFormDeleteEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = employeeRepository.findById(id);
        request.setAttribute("employee", employee);
        RequestDispatcher dispatcher = request.getRequestDispatcher("employee/delete_employee.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
           e.printStackTrace();
        }
    }

    private void showFormEditEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));

        Employee employee = employeeRepository.findById(id);
        List<Position> positions = positionRepository.showList();
        List<EducationDegree> educationDegrees = educationDegreeRepository.showList();
        List<Division> divisions = divisionRepository.showList();

        request.setAttribute("positions", positions);
        request.setAttribute("educationDegrees", educationDegrees);
        request.setAttribute("divisions", divisions);
        request.setAttribute("employee", employee);

        RequestDispatcher dispatcher = request.getRequestDispatcher("employee/edit_employee.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void listEmployee(HttpServletRequest request, HttpServletResponse response) {
        List<EmployeeDTO> list = employeeRepository.showListDTO();
        request.setAttribute("list", list);
        RequestDispatcher dispatcher = request.getRequestDispatcher("employee/list_employee.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormCreateEmployee(HttpServletRequest request, HttpServletResponse response) {
        List<Position> positions = positionRepository.showList();
        List<EducationDegree> educationDegrees = educationDegreeRepository.showList();
        List<Division> divisions = divisionRepository.showList();

        request.setAttribute("positions", positions);
        request.setAttribute("educationDegrees", educationDegrees);
        request.setAttribute("divisions", divisions);

        RequestDispatcher dispatcher = request.getRequestDispatcher("employee/create_employee.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showListService(HttpServletRequest request, HttpServletResponse response) {
        List<Service> list = serviceRepository.showList();
        request.setAttribute("list", list);
        RequestDispatcher dispatcher = request.getRequestDispatcher("service/list_service.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormCreateService(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("service/create_service.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormEditCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerRepository.findById(id);
        request.setAttribute("customer", customer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/edit_customer.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormDeleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerRepository.findById(id);
        request.setAttribute("customer", customer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/delete_customer.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormCreateCustomer(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/create_customer.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
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
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "createCustomer":
                createCustomer(request, response);
                break;
            case "editCustomer":
                editCustomer(request, response);
                break;
            case "deleteCustomer":
                deleteCustomer(request, response);
                break;
            case "findCustomerByName":
                findCustomerByName(request, response);
                break;

            // service
            case "createService":
                createService(request, response);
                break;
            //EMPLOYEE
            case "createEmployee":
                createEmployee(request, response);
                break;
            case "editEmployee":
                editEmployee(request, response);
                break;
            case "deleteEmployee":
                deleteEmployee(request, response);
                break;
            case "findEmployeeByName":
                findEmployeeByName(request, response);
        }
    }

    private void findEmployeeByName(HttpServletRequest request, HttpServletResponse response) {
        String kw = request.getParameter("kw");
        List<EmployeeDTO> list = employeeRepository.findByName(kw);
        request.setAttribute("list", list);
        RequestDispatcher dispatcher = request.getRequestDispatcher("employee/list_employee.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
           e.printStackTrace();
        }
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        employeeRepository.delete(id);
        try {
            response.sendRedirect("furama?action=listEmployee");
        } catch (IOException e) {
            e.printStackTrace();
        }


    }

    private void editEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String dob = request.getParameter("dob");
        String idcard = request.getParameter("idcard");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int position = Integer.parseInt(request.getParameter("position"));
        int educationDegree = Integer.parseInt(request.getParameter("educationDegree"));
        int division = Integer.parseInt(request.getParameter("division"));
        String userName = request.getParameter("userName");

        Employee employee = new Employee(id, name, dob, idcard, salary, phone, email, address, position, educationDegree, division, userName);
        employeeRepository.edit(employee);

        try {
            response.sendRedirect("/furama?action=listEmployee");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createEmployee(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String dob = request.getParameter("dob");
        String idcard = request.getParameter("idcard");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int position = Integer.parseInt(request.getParameter("position"));
        int educationDegree = Integer.parseInt(request.getParameter("educationDegree"));
        int division = Integer.parseInt(request.getParameter("division"));
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");

        User user = new User(userName, password);
        userRepository.addUser(user);
        Employee employee = new Employee(name, dob, idcard, salary, phone, email, address, position, educationDegree, division, userName);
        employeeRepository.add(employee);

        try {
            response.sendRedirect("/furama?action=listEmployee");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createService(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        int area = Integer.parseInt(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
        String standardRoom = request.getParameter("standard");
        String description = request.getParameter("description");
        double areaPool = Double.parseDouble(request.getParameter("pool"));
        int floor = Integer.parseInt(request.getParameter("floor"));
        int rent = Integer.parseInt(request.getParameter("rent"));
        int type = Integer.parseInt(request.getParameter("type"));

        RentType rentType = rentTypeRepository.findById(rent);
        ServiceType serviceType = serviceTypeRepository.findById(type);

        Service service = new Service(name, area, cost, maxPeople, standardRoom, description, areaPool, floor, rentType, serviceType);

        serviceRepository.add(service);
        try {
            response.sendRedirect("/furama?action=listService");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void findCustomerByName(HttpServletRequest request, HttpServletResponse response) {
        String kw = request.getParameter("kw");
        List<Customer> list = customerRepository.findByName(kw);
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

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        customerRepository.delete(id);
        try {
            response.sendRedirect("furama?action=lisCustomer");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String dob = request.getParameter("dob");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String idcard = request.getParameter("idcard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int idType = Integer.parseInt(request.getParameter("typeCustomer"));
        CustomerType customerType = customerTypeRepository.findById(idType);
        Customer customer = new Customer(id, customerType, name, dob, gender, idcard, phone, email, address);
        customerRepository.edit(customer);
        try {
            response.sendRedirect("/furama?action=lisCustomer");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String dob = request.getParameter("dob");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String idcard = request.getParameter("idcard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int idType = Integer.parseInt(request.getParameter("typeCustomer"));
        CustomerType customerType = customerTypeRepository.findById(idType);
        Customer customer = new Customer(customerType, name, dob, gender, idcard, phone, email, address);
        customerRepository.add(customer);
        try {
            response.sendRedirect("/furama?action=lisCustomer");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
