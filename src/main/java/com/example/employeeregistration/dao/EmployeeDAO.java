package com.example.employeeregistration.dao;


import com.example.employeeregistration.model.Employee;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public interface EmployeeDAO {
    Connection getConnection() throws ClassNotFoundException, SQLException;
    int addEmployee(Employee  employee) throws SQLException, ClassNotFoundException;

    ArrayList<Employee> getEmployees() throws SQLException, ClassNotFoundException;

    Employee getEmployee(String param) throws SQLException, ClassNotFoundException;
    int updateEmployee(Employee employee) throws SQLException, ClassNotFoundException;
    int deleteEmployee(Employee employee) throws SQLException, ClassNotFoundException;
}
