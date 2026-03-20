package com.example.employeeregistration.dao;

import com.example.employeeregistration.model.Employee;
import com.example.utils.MySQLParams;
import java.sql.*;
import java.util.ArrayList;

public class EmployeeDAOMySQLImpl implements EmployeeDAO {

    @Override
    public Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection conn;
        Class.forName("com.mysql.cj.jdbc.Driver");

        //Get the DB Connection
        conn = DriverManager.getConnection(MySQLParams.URL, MySQLParams.TEST_USER_NAME, MySQLParams.TEST_PASSWORD);
        System.out.println("Connection Created");
        return conn;
    }

    public int addEmployee(Employee employee) throws SQLException, ClassNotFoundException {

        Connection conn;
        int num;

        conn = getConnection();

        String SQL = "INSERT INTO mydb.employee(first_name, last_name,user_name,password,email,phone) values(?,?,?,?,?,?)";

        PreparedStatement preparedStatement = conn.prepareStatement(SQL);
        preparedStatement.setString(1, employee.getFirstName());
        preparedStatement.setString(2, employee.getLastName());
        preparedStatement.setString(3, employee.getUserName());
        preparedStatement.setString(4, employee.getPassword());
        preparedStatement.setString(5, employee.getEmail());
        preparedStatement.setString(6, employee.getPhoneNumber());

        num = preparedStatement.executeUpdate();
        System.out.println("Successfully inserted " + num + " record into mydb.employee table");

        try{
            conn.close();
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return num;
    }

    @Override
    public ArrayList<Employee> getEmployees() throws SQLException, ClassNotFoundException {

        Connection conn;
        String SQL = "SELECT * FROM mydb.employee;";
        ArrayList<Employee> employees = new ArrayList<>();

        conn = getConnection();
        Statement statement = conn.createStatement();
        ResultSet resultSet = statement.executeQuery(SQL);
        int empID;

        while (resultSet.next()) {
            Employee employee = new Employee();
            empID = resultSet.getInt("emp_id");
            System.out.println("EmployeeID: "+empID);
            employee.setEmpID(resultSet.getInt("emp_id"));
            employee.setFirstName(resultSet.getString("first_name"));
            employee.setLastName(resultSet.getString("last_name"));
            employee.setUserName(resultSet.getString("user_name"));
            employee.setEmail(resultSet.getString("email"));
            employee.setPhoneNumber(resultSet.getString("phone"));

            employees.add(employee);
        }

        try{
            conn.close();
        }
        catch (SQLException e){
            e.printStackTrace();
        }

        return employees;
    }

    @Override
    public Employee getEmployee(String param) throws SQLException, ClassNotFoundException {

        Connection conn;

        String SQL = "SELECT * FROM mydb.employee where emp_id = ?;";
        System.out.println("SQL:"+ SQL + " " + param);

        Employee employee = new Employee();

        conn = getConnection();
        PreparedStatement statement = conn.prepareStatement(SQL);
        statement.setInt(1, Integer.parseInt(param));
        ResultSet resultSet = statement.executeQuery();

        if (resultSet.next()) {
            employee.setEmpID(resultSet.getInt("emp_id"));
            employee.setFirstName(resultSet.getString("first_name"));
            employee.setLastName(resultSet.getString("last_name"));
            employee.setUserName(resultSet.getString("user_name"));
            employee.setPassword(resultSet.getString("password"));
            employee.setEmail(resultSet.getString("email"));
            employee.setPhoneNumber(resultSet.getString("phone"));
        }

        try{
            conn.close();
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return employee;
    }

    @Override
    public int updateEmployee(Employee employee) throws SQLException, ClassNotFoundException {
        Connection conn;
        int num;

        conn = getConnection();
        StringBuilder SQL = new StringBuilder("UPDATE mydb.employee set ");
        ArrayList<Object> params = new ArrayList<>();

        if (employee.getFirstName() != null) {
            SQL.append("first_name= ?, ");
            params.add(employee.getFirstName());
        }
        if (employee.getLastName() != null) {
            SQL.append("last_name= ?, ");
            params.add(employee.getLastName());
        }
        if (employee.getUserName() != null) {
            SQL.append("user_name=?, ");
            params.add(employee.getUserName());
        }
        if(employee.getPassword()!=null) {
            SQL.append("password=? ");
            params.add(employee.getPassword());
        }
        if (employee.getEmail() != null) {
            SQL.append("email=?, ");
            params.add(employee.getEmail());
        }
        if (employee.getPhoneNumber() != null) {
            SQL.append("phone=?, ");
            params.add(employee.getPhoneNumber());
        }
        SQL.setLength(SQL.length()-2);

        SQL.append(" where emp_id=?");
        params.add(employee.getEmpID());

        PreparedStatement prepStmt = conn.prepareStatement(SQL.toString());
        for (int i = 0; i < params.size(); i++) {
            prepStmt.setObject(i + 1, params.get(i));
        }
        System.out.println("SQL: " + prepStmt);
        num = prepStmt.executeUpdate();

        System.out.println("Successfully updated " + num + " record(s) into mydb.employee table");

        try{
            conn.close();
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return num;
    }

    @Override
    public int deleteEmployee(Employee employee) throws SQLException, ClassNotFoundException {
        Connection conn;
        int num;

        conn = getConnection();

        int empID = employee.getEmpID();
        String SQL = "DELETE FROM mydb.employee where emp_id=? ";
        System.out.println("SQL: " + SQL + " " + empID);

        PreparedStatement statement = conn.prepareStatement(SQL);
        statement.setInt(1, empID);
        System.out.println("PrepStmt: " +statement);
        num = statement.executeUpdate();

        System.out.println("Successfully deleted " + num + " record(s) from mydb.employee table");

        try{
            conn.close();
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return num;
    }
}