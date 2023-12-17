package com.casestudy.module2_accountname_wbe.repository.employee;

import com.casestudy.module2_accountname_wbe.model.employee.Employee;
import com.casestudy.module2_accountname_wbe.model.employee.EmployeeDTO;
import com.casestudy.module2_accountname_wbe.repository.BaseRepository;
import com.casestudy.module2_accountname_wbe.repository.IRepositoy;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository implements IRepositoy<Employee> {
    private static final String FIND_BY_NAME = "select e.* , p.position_name as position, d.division_name as division, ed.education_degree_name as education\n" +
            "from employee e \n" +
            "join position p on e.position_id = p.position_id\n" +
            "join division d on e.division_id = d.division_id\n" +
            "join education_degree ed on ed.education_degree_id = e.education_degree_id \n" +
            "where e.employee_name like ?;";
    private static final String INSERT_EMPLOYEE_AND_USER = "insert into employee(" +
            "employee_name, employee_birthday, employee_salary, employee_id_card, employee_phone," +
            " employee_email, employee_address, position_id, education_degree_id,division_id, username) value" +
            "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String SELECT_ALL = "select * from employee where employee_status = 0";
    private static final String SELECT_ALL_DTO = "select e.* , p.position_name as position, d.division_name as division, ed.education_degree_name as education\n" +
            "from employee e \n" +
            "join position p on e.position_id = p.position_id\n" +
            "join division d on e.division_id = d.division_id\n" +
            "join education_degree ed on ed.education_degree_id = e.education_degree_id \n" +
            "where employee_status = 0;";

    //    private static final String FIND_BY_ID = "select * from employee where employee_id = ?;";
    private static final String FIND_BY_ID = "select e.* , p.position_name as position, d.division_name as division, ed.education_degree_name as education\n" +
            "from employee e \n" +
            "join position p on e.position_id = p.position_id\n" +
            "join division d on e.division_id = d.division_id\n" +
            "join education_degree ed on ed.education_degree_id = e.education_degree_id \n" +
            "where employee_id = ?;";
    private static final String UPDATE_EMPLOYEE = "update employee set employee_name = ?, employee_birthday = ?, " +
            "employee_salary = ?, employee_id_card = ?, employee_phone = ?," +
            "employee_email =?, employee_address=?, position_id=?, education_degree_id=?," +
            "division_id=?, username=? " +
            "where employee_id = ?";

    private static final String DELETE_EMPLOYEE = "update employee set employee_status = 1 where employee_id = ?";


    @Override
    public List<Employee> showList() {
        List<Employee> list = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("employee_id");
                String name = resultSet.getString("employee_name");
                String birthday = resultSet.getString("employee_birthday");
                double salary = resultSet.getDouble("employee_salary");
                String idCard = resultSet.getString("employee_id_card");
                String phone = resultSet.getString("employee_phone");

                String email = resultSet.getString("employee_email");
                String address = resultSet.getString("employee_address");
                int position_id = resultSet.getInt("position_id");
                int education_degree_id = resultSet.getInt("education_degree_id");
                int division_id = resultSet.getInt("division_id");
                String userName = resultSet.getString("username");

                Employee employee = new Employee(id, name, birthday, idCard, salary, phone, email, address, position_id, education_degree_id, division_id, userName);
                list.add(employee);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<EmployeeDTO> showListDTO() {
        List<EmployeeDTO> list = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_DTO);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("employee_id");
                String name = resultSet.getString("employee_name");
                String birthday = resultSet.getString("employee_birthday");
                double salary = resultSet.getDouble("employee_salary");
                String idCard = resultSet.getString("employee_id_card");
                String phone = resultSet.getString("employee_phone");

                String email = resultSet.getString("employee_email");
                String address = resultSet.getString("employee_address");
                String position = resultSet.getString("position");
                String education = resultSet.getString("education");
                String division = resultSet.getString("division");
                String userName = resultSet.getString("username");

                EmployeeDTO employeeDTO = new EmployeeDTO(id, name, birthday, idCard, salary, phone, email, address, position, education, division, userName);
                list.add(employeeDTO);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public void add(Employee employee) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_EMPLOYEE_AND_USER);
            preparedStatement.setString(1, employee.getName());
            preparedStatement.setString(2, employee.getBirthday());
            preparedStatement.setDouble(3, employee.getSalary());
            preparedStatement.setString(4, employee.getIdCard());
            preparedStatement.setString(5, employee.getPhone());
            preparedStatement.setString(6, employee.getEmail());
            preparedStatement.setString(7, employee.getAddress());

            preparedStatement.setInt(8, employee.getPosition());
            preparedStatement.setInt(9, employee.getEducationDegree());
            preparedStatement.setInt(10, employee.getDivision());
            preparedStatement.setString(11, employee.getUser());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void edit(Employee employee) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_EMPLOYEE);
            preparedStatement.setString(1, employee.getName());
            preparedStatement.setString(2, employee.getBirthday());
            preparedStatement.setDouble(3, employee.getSalary());
            preparedStatement.setString(4, employee.getIdCard());
            preparedStatement.setString(5, employee.getPhone());
            preparedStatement.setString(6, employee.getEmail());
            preparedStatement.setString(7, employee.getAddress());
            preparedStatement.setInt(8, employee.getPosition());
            preparedStatement.setInt(9, employee.getEducationDegree());
            preparedStatement.setInt(10, employee.getDivision());
            preparedStatement.setString(11, employee.getUser());
            preparedStatement.setInt(12, employee.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_EMPLOYEE);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Employee findById(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int idEmployee = resultSet.getInt("employee_id");
                String name = resultSet.getString("employee_name");
                String birthday = resultSet.getString("employee_birthday");
                double salary = resultSet.getDouble("employee_salary");
                String idCard = resultSet.getString("employee_id_card");
                String phone = resultSet.getString("employee_phone");

                String email = resultSet.getString("employee_email");
                String address = resultSet.getString("employee_address");
                int position_id = resultSet.getInt("position_id");
                int education_degree_id = resultSet.getInt("education_degree_id");
                int division_id = resultSet.getInt("division_id");
                String userName = resultSet.getString("username");
                Employee employee = new Employee(idEmployee, name, birthday, idCard, salary, phone, email, address, position_id, education_degree_id, division_id, userName);
                return employee;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<EmployeeDTO> findByName(String keyword) {
        List<EmployeeDTO> list = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_NAME);
            preparedStatement.setString(1, "% " + keyword);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("employee_id");
                String name = resultSet.getString("employee_name");
                String birthday = resultSet.getString("employee_birthday");
                double salary = resultSet.getDouble("employee_salary");
                String idCard = resultSet.getString("employee_id_card");
                String phone = resultSet.getString("employee_phone");

                String email = resultSet.getString("employee_email");
                String address = resultSet.getString("employee_address");
                String position = resultSet.getString("position");
                String education = resultSet.getString("education");
                String division = resultSet.getString("division");
                String userName = resultSet.getString("username");

                EmployeeDTO employeeDTO = new EmployeeDTO(id, name, birthday, idCard, salary, phone, email, address, position, education, division, userName);
                list.add(employeeDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

}
