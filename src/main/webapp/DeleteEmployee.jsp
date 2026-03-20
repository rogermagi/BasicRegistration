<%@ page import="com.example.employeeregistration.model.Employee" %>
<%@ page import="com.fasterxml.jackson.databind.node.ObjectNode" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Employee</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<form name="employee-form" action="${pageContext.request.contextPath}/emp-servlet" method="POST">
    <input type="hidden" name="_method" value="DELETE">
    <table class="tg">
        <tbody>
        <%
            //Employee employee = (Employee) session.getAttribute("employee");
            String employeeJson = (String)request.getAttribute("employee");
            System.out.println("Employee:" +employeeJson);
            ObjectMapper mapper = new ObjectMapper();
            ObjectNode employee = mapper.readValue(employeeJson,ObjectNode.class);
        %>
        <tr>
            <td class="tg-0pky" colspan="2"><h1>Delete Employee</h1></td>
        </tr>
        <tr>
            <td class="tg-0pky" colspan="2"><h3>Are you sure you want to delete the employee?</h3></td>
        </tr>
        <tr>
            <td class="tg-0pky"><label>Employee ID </label></td>
            <td class="tg-0pky"><input type="text" name="empid" value=<%=employee.get("empID")%> readonly/></td>
        </tr>
        <tr>
            <td class="tg-0pky"><label>First Name </label></td>
            <td class="tg-0pky"><input type="text" name="fname" value=<%=employee.get("firstName")%> disabled/></td>
       </tr>
        <tr>
            <td class="tg-0pky"><label>Last Name </label></td>
            <td class="tg-0pky"><input type="text" name="lname" value=<%=employee.get("lastName")%> disabled/></td>

        </tr>
        <tr>
            <td class="tg-0pky"><label>User Name </label></td>
            <td class="tg-0pky"><input type="text" name="uname" value=<%=employee.get("userName")%> disabled/></td>
        </tr>
        <tr>
            <td class="tg-0pky"><label>New Password </label></td>
            <td class="tg-0pky"><input type="password" name="password" value=<%=employee.get("password")%> disabled/></td>
        </tr>
        <tr>
            <td class="tg-0pky"><label>Email </label></td>
            <td class="tg-0pky"><input type="email" name="email" value=<%=employee.get("email")%> disabled/></td>
        </tr>
        <tr>
            <td class="tg-0pky"><label>Phone Number </label></td>
            <td class="tg-0pky"><input type="tel" name="phone" value=<%=employee.get("phoneNumber")%> disabled/></td>
        </tr>

        <tr>
            <td class="tg-0pky" colspan="2"><button class="button" id="deleteButton" type="submit">YES!! Delete Employee</button></td>
        </tr>
        <tr>
            <td class="tg-0pky" colspan="2"><h3><a href="index.html">NO!! Return to Dashboard</a></h3></td>
        </tr>
        </tbody>
    </table>
</form>
<div id="result"></div>
<script>
    /*document.addEventListener('DOMContentLoaded', (event) => {
      // The DOM is ready.
      console.log('DOM fully loaded and parsed');

      document.querySelector('form').addEventListener('submit', function (event) {
        event.preventDefault(); // Stop default form submission
        const formData = new FormData(document.querySelector('form'));
        const data = Object.fromEntries(formData.entries());
        console.dir(this);
        console.log("Form Data: "+data);
        const stringValue = JSON.stringify(data);
        console.log("Stringified Data: "+stringValue);
        const newData = "newempid=" + encodeURIComponent(document.getElementById("newempid"))
                      + "newfname=" + encodeURIComponent(document.getElementById("newfname"))
                      + "newlname=" + encodeURIComponent(document.getElementById("newlname"))
                      + "newuname=" + encodeURIComponent(document.getElementById("newuname"))
                      + "newpassword=" + encodeURIComponent(document.getElementById("newpassword"))
                      + "newemail=" + encodeURIComponent(document.getElementById("newemail"))
                      + "newphone=" + encodeURIComponent(document.getElementById("newphone"));
        console.log("New Data: "+newData);

        fetch('/EmployeeRegistration/emp-servlet', {
            method: 'PUT',
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: formData,
          })
            .then(response => {
              if(response.ok) {
                console.log("PUT Request was successful");
                window.location.href = "success.jsp"
              }
              else{
                console.log("PUT Request failed");
                window.location.href = "failure.jsp"
              }
            });
      });
    });*/

    /*function updateEmployee() {
      const form = document.getElementById("employee-form");
      const formData = new FormData(form);

      fetch('/EmployeeRegistration/emp-servlet', {
        method: 'PUT',
        headers: {
          'Content-Type': 'application/json',
        },
        body: formData,
      })
              .then(response => {
                if(response.ok) {
                  console.log("PUT Request was successfull");
                }
              });
    }*/
</script>

</body>
</html>
