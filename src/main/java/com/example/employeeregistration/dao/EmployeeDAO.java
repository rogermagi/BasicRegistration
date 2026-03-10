package com.example.employeeregistration.dao;


import com.example.employeeregistration.model.Employee;

import java.sql.Array;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public interface EmployeeDAO {
    public Connection getConnection() throws ClassNotFoundException, SQLException;
    public int addEmployee(Employee  employee) throws SQLException, ClassNotFoundException;

    public ArrayList<Employee> getEmployees() throws SQLException, ClassNotFoundException;

    public Employee getEmployee(String param) throws SQLException, ClassNotFoundException;
    public int updateEmployee(Employee employee) throws SQLException, ClassNotFoundException;
    public int deleteEmployee(Employee employee) throws SQLException, ClassNotFoundException;
}
