package com.example.employeeregistration.controller;

import com.example.employeeregistration.dao.DAOFactory;
import com.example.employeeregistration.dao.EmployeeDAO;
import com.example.employeeregistration.model.Employee;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/emp-servlet")
public class EmployeeServlet extends HttpServlet {

    EmployeeDAO employeeDAO = null;

    @Override
    public void init() throws ServletException {

        employeeDAO = DAOFactory.getEmployeeDAO(getServletContext().getInitParameter("database-name"));
    }

    //C - CRUD
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("I am in doPOST()");
        try {
            //UPDATE & DELETE flag for doPut() and doDelete()
            String method = request.getParameter("_method");
            System.out.println("Method in request:"+method);

            if (method != null) {
                if (method.equals("UPDATE")) {
                    System.out.println("Forwarding to doPUT");
                    doPut(request, response);
                } else if (method.equals("DELETE")) {
                    System.out.println("Forwarding to doDELETE");
                    doDelete(request, response);
                }
            } else {
                System.out.println("Performing INSERT to AddEmployee");
                Employee employee = new Employee();
                employee.setFirstName(request.getParameter("fname"));
                employee.setLastName(request.getParameter("lname"));
                employee.setUserName(request.getParameter("uname"));
                employee.setPassword(request.getParameter("password"));
                employee.setEmail(request.getParameter("email"));
                employee.setPhoneNumber(request.getParameter("phone"));

                employeeDAO.addEmployee(employee);
                response.sendRedirect("success.jsp");
            }
        } catch (Exception ex){
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            try {
                response.sendRedirect("failure.jsp");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }
    //R - CRUD
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("I am in doGET()");

        HttpSession session = request.getSession();
        String empid = request.getParameter("empid");
        System.out.println("EmpID in request:" + empid);

        //Flag to indicate AddEmployee or UpdateEmployee or DeleteEmployee
        String flag = request.getParameter("flag");
        System.out.println("Flag in request:"+flag);
        System.out.println("QueryString:"+request.getQueryString());

        try {
            if (empid != null) {
                System.out.println("calling getEmployee()");
                Employee employee = employeeDAO.getEmployee(empid);
                session.setAttribute("employee", employee);
                if (flag != null) {
                    if (flag.equals("UPDATE")) {
                        System.out.println("Forwarding to Update");
                        request.getRequestDispatcher("UpdateEmployee.jsp").forward(request, response);
                    } else if (flag.equals("DELETE")) {
                        System.out.println("Forwarding to Delete");
                        request.getRequestDispatcher("DeleteEmployee.jsp").forward(request, response);
                    }
                } else {
                    String errorMessage = "Something Wrong !!!Update or Delete Flag not found in the REQUEST";
                    System.out.println(errorMessage);
                    session.setAttribute("errorMessage", errorMessage);
                    response.sendRedirect("failure.jsp");
                }
            } else if (flag != null && flag.equals("ADD")) {
                System.out.println("Forwarding to Add");
                request.getRequestDispatcher("AddEmployee.jsp").forward(request, response);
            } else {
                System.out.println("calling getEmployees()");
                ArrayList<Employee> employees = employeeDAO.getEmployees();
                session.setAttribute("employees", employees);
                request.getRequestDispatcher("ViewEmployees.jsp").forward(request, response);
            }
        } catch (Exception ex){
            session.setAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            try {
                response.sendRedirect("failure.jsp");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    //U - CRUD
    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("I am in doPUT()");

        try {
            Employee employee = new Employee();
            String empid = request.getParameter("newempid");
            System.out.println("Employee ID: " + empid);

            String fname = request.getParameter("newfname");
            String lname = request.getParameter("newlname");
            String uname = request.getParameter("newuname");
            String password = request.getParameter("newpassword");
            String email = request.getParameter("newemail");
            String phone = request.getParameter("newphone");

            if (empid != null)
                employee.setEmpID(Integer.parseInt(empid));
            else
                employee.setEmpID(0);
            if(fname != null && !fname.isEmpty())
                employee.setFirstName(fname);
            else
                employee.setFirstName(null);
            if(lname != null && !lname.isEmpty())
                employee.setLastName(lname);
            else
                employee.setLastName(null);
            if(uname != null && !uname.isEmpty())
                employee.setUserName(uname);
            else
                employee.setUserName(null);
            if(password != null && !password.isEmpty())
                employee.setPassword(password);
            else
                employee.setPassword(null);
            if(email != null && !email.isEmpty())
                employee.setEmail(email);
            else
                employee.setEmail(null);
            if(phone != null && !phone.isEmpty())
                employee.setPhoneNumber(phone);
            else
                employee.setPhoneNumber(null);

            System.out.println("Calling updateEmployee()");

            int rows = employeeDAO.updateEmployee(employee);
            System.out.println("Updated the Employee details in DB");
            //request.getRequestDispatcher("success.jsp").forward(request, response);
            response.sendRedirect("success.jsp");
        } catch (Exception ex){
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            try {
                response.sendRedirect("failure.jsp");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    //D - CRUD
    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("I am in doDELETE()");
        try {
            Employee employee = new Employee();
            String empid = request.getParameter("empid");
            System.out.println("Employee ID: " + empid);

            employee.setEmpID(Integer.parseInt(empid));
            int rows = employeeDAO.deleteEmployee(employee);
            System.out.println("Deleted the Employee from the DB");
            response.sendRedirect("success.jsp");
        } catch (Exception ex){
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            try {
                response.sendRedirect("failure.jsp");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }
}