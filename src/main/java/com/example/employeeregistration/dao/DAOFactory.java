package com.example.employeeregistration.dao;

import jakarta.faces.context.FacesContext;
import jakarta.servlet.ServletContext;

public class DAOFactory {
    public static DAOFactory daoFactory;
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
