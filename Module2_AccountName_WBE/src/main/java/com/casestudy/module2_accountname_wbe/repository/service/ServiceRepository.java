package com.casestudy.module2_accountname_wbe.repository.service;

import com.casestudy.module2_accountname_wbe.model.service.RentType;
import com.casestudy.module2_accountname_wbe.model.service.Service;
import com.casestudy.module2_accountname_wbe.model.service.ServiceType;
import com.casestudy.module2_accountname_wbe.repository.BaseRepository;
import com.casestudy.module2_accountname_wbe.repository.IRepositoy;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceRepository implements IRepositoy<Service> {
    private static RentTypeRepository rentTypeRepository = new RentTypeRepository();
    private static ServiceTypeRepository serviceTypeRepository = new ServiceTypeRepository();
    private static final String INSERT_INTO_SERVICE = "insert into service(" +
            "service_name, service_area,  service_cost, service_max_people," +
            " rent_type_id, service_type_id, standard_room, description_other_convenience,pool_area, number_of_floors)\n" +
            "value (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String SELECT_ALL_SERVICE = "select * from service where service_status = 0;";

    @Override
    public List<Service> showList() {
        List<Service> list = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SERVICE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("service_id");
                String name = resultSet.getString("service_name");
                int area = resultSet.getInt("service_area");
                double cost = resultSet.getDouble("service_cost");
                int people = resultSet.getInt("service_max_people");
                int rent = resultSet.getInt("rent_type_id");
                int service = resultSet.getInt("service_type_id");
                String standard = resultSet.getString("standard_room");
                String des = resultSet.getString("description_other_convenience");
                double pool = resultSet.getDouble("pool_area");
                int floor = resultSet.getInt("number_of_floors");

                ServiceType serviceType = serviceTypeRepository.findById(service);
                RentType rentType = rentTypeRepository.findById(rent);

                list.add(new Service(id, name, area, cost, people, standard, des, pool, floor, rentType, serviceType));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public void add(Service service) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_SERVICE);
            preparedStatement.setString(1, service.getName());
            preparedStatement.setInt(2, service.getArea());
            preparedStatement.setDouble(3, service.getCost());
            preparedStatement.setInt(4, service.getMaxPeople());
            preparedStatement.setInt(5, service.getRentType().getId());
            preparedStatement.setInt(6, service.getServiceType().getId());
            preparedStatement.setString(7, service.getStandardRoom());
            preparedStatement.setString(8, service.getDescription());
            preparedStatement.setDouble(9, service.getAreaPool());
            preparedStatement.setInt(10, service.getFloor());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void edit(Service service) {

    }

    @Override
    public void delete(int id) {

    }

    @Override
    public Service findById(int id) {
        return null;
    }
}
