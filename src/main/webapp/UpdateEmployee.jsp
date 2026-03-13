<%@ page import="com.example.employeeregistration.model.Employee" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Employee</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<form name="employee-form" action="emp-servlet" method="POST">
  <input type="hidden" name="_method" value="UPDATE">
  <table class="tg">
    <tbody>
    <%
      Employee employee = (Employee) session.getAttribute("employee");
      System.out.println("Employee:" +employee);
    %>
    <tr><th colspan="3"><h1>Update Employee Details Form</h1></th></tr>
    <tr>
      <td class="tg-0pky">Field Name</td>
      <td class="tg-0pky">Old Value</td>
      <td class="tg-0pky">New Value</td>
    </tr>
    <tr>
      <td class="tg-0pky"><label>Employee ID </label></td>
      <td class="tg-0pky"><input type="text" name="empid" value="<%=employee.getEmpID()%>" disabled/></td>
      <td class="tg-0pky"><input type="text" name="newempid" id="newempid" value="<%=employee.getEmpID()%>" readonly/></td>

    </tr>
    <tr>
      <td class="tg-0pky"><label>First Name </label></td>
      <td class="tg-0pky"><input type="text" name="fname" value="<%=employee.getFirstName()%>" disabled/></td>
      <td class="tg-0pky"><input type="text" name="newfname" id="newfname"/></td>
    </tr>
    <tr>
      <td class="tg-0pky"><label>Last Name </label></td>
      <td class="tg-0pky"><input type="text" name="lname" value="<%=employee.getLastName()%>" disabled/></td>
      <td class="tg-0pky"><input type="text" name="newlname" id="newlname"/></td>
    </tr>
    <tr>
      <td class="tg-0pky"><label>User Name </label></td>
      <td class="tg-0pky"><input type="text" name="uname" value="<%=employee.getUserName()%>" disabled/></td>
      <td class="tg-0pky"><input type="text" name="newuname" id="newuname"/></td>
    </tr>
    <tr>
      <td class="tg-0pky"><label>New Password </label></td>
      <td class="tg-0pky"><input type="password" name="password" value="<%=employee.getPassword()%>" disabled/></td>
      <td class="tg-0pky"><input type="password" name="newpassword" id="newpassword"/> <br></td>
    </tr>
    <tr>
      <td class="tg-0pky"><label>Email </label></td>
      <td class="tg-0pky"><input type="email" name="email" value="<%=employee.getEmail()%>" disabled/></td>
      <td class="tg-0pky"><input type="email" name="newemail" id="newemail"/></td>
    </tr>

    <tr>
      <td class="tg-0pky"><label>Phone Number </label></td>
      <td class="tg-0pky"><input type="tel" name="phone" value="<%=employee.getPhoneNumber()%>" disabled/></td>
      <td class="tg-0pky"><input type="tel" name="newphone" id="newphone"/></td>
    </tr>

    <tr>
      <td class="tg-0pky" colspan="3"><button class="button" id="updateButton" type="submit">Update Employee</button></td>
    </tr>
    <tr>
      <td class="tg-0pky" colspan="3"><h3><a href="index.html">Return to Dashboard</a></h3></td>
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
