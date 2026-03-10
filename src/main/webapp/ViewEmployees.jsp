<%@ page import="java.util.ArrayList,com.example.employeeregistration.model.*" %>
<%@ page import="java.io.IOException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee Details</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <table class="tg">
        <thead>
            <tr><th colspan="8"><h1>Employee Details Page</h1></th></tr>
            <tr>
                <th class="tg-0pky">Employee ID</th>
                <th class="tg-0pky">First Name</th>
                <th class="tg-0lax">Last Name</th>
                <th class="tg-0lax">User Name</th>
                <th class="tg-0lax">Email</th>
                <th class="tg-0lax">Phone Number</th>
                <th class="tg-0lax">Update ??</th>
                <th class="tg-0lax">Delete ??</th>
            </tr>
        </thead>
        <tbody>

            <%
                ArrayList<Employee> employees = (ArrayList)session.getAttribute("employees");
                //out.println("Employees Object:" + employees);
                out.println("<form id=\"empForm\" action=\"/EmployeeRegistration/emp-servlet\">");
                for(Employee emp : employees){
                    out.println("<tr>");
                    out.println("<td class=\"tg-0pky\">" + emp.getEmpID() + "</td>");
                    out.println( "<td class=\"tg-0pky\">" + emp.getFirstName() + "</td>");
                    out.println("<td class=\"tg-0lax\">" + emp.getLastName() + "</td>");
                    out.println("<td class=\"tg-0lax\">" + emp.getUserName() + "</td>");
                    out.println("<td class=\"tg-0lax\">" + emp.getEmail() + "</td>");
                    out.println("<td class=\"tg-0lax\">" + emp.getPhoneNumber() + "</td>");
                    out.println("<td class=\"tg-0lax\"><button id=\"update-button-" + emp.getEmpID() + "\" onclick=\"submitForm(\'UPDATE\'," + emp.getEmpID() + ")\">Update Emp</button></td>");
                    out.println("<td class=\"tg-0lax\"><button id=\"delete-button-" + emp.getEmpID() + "\" onclick=\"submitForm(\'DELETE\'," + emp.getEmpID() + ")\">Delete Emp</button></td>");
                    out.println("</tr>");
                }
                out.println("</form");
            %>
            <tr><td colspan="8"><h3><a href="index.html">Return to Dashboard</a></h3></td></tr>
        </tbody>
    </table>
<script>
    //document.addEventListener('DOMContentLoaded', (event) => {
        function submitForm(flagValue, empID) {
            console.log("Manually submitting the form");

            const input = document.createElement("input");
            input.setAttribute("type", "hidden");
            input.setAttribute("name", "empid");
            input.setAttribute("value", empID);

            const form = document.getElementById("empForm");
            form.appendChild(input);

            const flag = document.createElement("input");
            flag.setAttribute("name", "flag");
            flag.setAttribute("value", flagValue);
            form.appendChild(flag);
            console.dir(form);

            document.getElementById("update-button-"+empID).addEventListener("click", function () {
                console.log("update-button-"+empID);
                form.submit();
            });
            document.getElementById("delete-button-"+empID).addEventListener("click", function () {
                console.log("delete-button-"+empID);
                form.submit();
            });
        }
    //});
</script>
</body>
</html>
