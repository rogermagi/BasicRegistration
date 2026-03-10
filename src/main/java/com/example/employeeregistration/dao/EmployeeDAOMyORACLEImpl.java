package com.example.employeeregistration.dao;

import com.example.employeeregistration.model.Employee;

import java.sql.Connection;
import java.util.ArrayList;

public class EmployeeDAOMyORACLEImpl implements EmployeeDAO {

    public EmployeeDAOMyORACLEImpl() {}

    @Override
    public Connection getConnection() {
        return null;
    }

    @Override
    public int addEmployee(Employee employee) {
        return 0;
    }

    @Override
    public ArrayList<Employee> getEmployees() {
        return null;
    }

    @Override
    public Employee getEmployee(String param) {
        return null;
    }

    @Override
    public int updateEmployee(Employee employee) {
        return 0;
    }

    @Override
    public int deleteEmployee(Employee employee) {return 0;}
}
