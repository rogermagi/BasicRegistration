package com.example.employeeregistration.dao;

public class DAOFactory {
    public static EmployeeDAO getEmployeeDAO(String databaseName) {
        EmployeeDAO employeeDAO = null;
        if("MYSQL".equals(databaseName)) {
            employeeDAO = new EmployeeDAOMySQLImpl();
        }
        else if("ORACLE".equals(databaseName)) {
            employeeDAO = new EmployeeDAOMyORACLEImpl();
        }
        return employeeDAO;
    }
}
