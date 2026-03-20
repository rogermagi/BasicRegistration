<%@ page import="java.util.ArrayList,com.example.employeeregistration.model.*" %>
<%@ page import="com.fasterxml.jackson.databind.node.ObjectNode" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="com.fasterxml.jackson.databind.JsonNode" %>
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
                //ArrayList<Employee> employees = (ArrayList<Employee>)session.getAttribute("employees");
                //String employeesJson = (String)session.getAttribute("employees");
                String employeesJson = (String)request.getAttribute("employees");
                ObjectMapper mapper = new ObjectMapper();
                //Employee[] employees = mapper.readValue(employeesJson, Employee[].class);
                ObjectNode[] employees = mapper.readValue(employeesJson, ObjectNode[].class);
                //out.println("Employees Object:" + employeesJson);
                /*

                {
                "empID":1,
                "firstName":"John",
                "lastName":"Doe",
                "userName":"johndoe",
                "password":null,
                "email":"johndoe@example.com",
                "phoneNumber":"123-456-7890"
                }
                */

                out.println("<form id='empForm' action='emp-servlet'>");
                for(JsonNode employee : employees){
                    out.println("<tr>");
                    out.println("<td class=\"tg-0pky\">" + employee.get("empID") + "</td>");
                    out.println( "<td class=\"tg-0pky\">" + employee.get("firstName") + "</td>");
                    out.println("<td class=\"tg-0lax\">" + employee.get("lastName") + "</td>");
                    out.println("<td class=\"tg-0lax\">" + employee.get("userName") + "</td>");
                    out.println("<td class=\"tg-0lax\">" + employee.get("email") + "</td>");
                    out.println("<td class=\"tg-0lax\">" + employee.get("phoneNumber") + "</td>");
                    out.println("<td class=\"tg-0lax\"><button id=\"update-button-" + employee.get("empID") + "\" onclick=\"submitForm('UPDATE'," + employee.get("empID") + ")\">Update Emp</button></td>");
                    out.println("<td class=\"tg-0lax\"><button id=\"delete-button-" + employee.get("empID") + "\" onclick=\"submitForm('DELETE'," + employee.get("empID") + ")\">Delete Emp</button></td>");
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
