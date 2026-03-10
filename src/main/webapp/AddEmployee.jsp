<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Registration</title>
    <link rel="stylesheet" href="style.css">
</head>
    <body>
        <form name="employee-form" action="emp-servlet" method="post">
            <table class="tg">
                <tbody>
                <tr>
                    <td class="tg-0pky" colspan="2"><h1>Employee Registration Form</h1></td>
                </tr>
                <tr>
                    <td class="tg-0pky"><label>First Name </label></td>
                    <td class="tg-0pky"><input type="text" name="fname"/></td>
                </tr>
                <tr>
                    <td class="tg-0pky"><label>Last Name </label></td>
                    <td class="tg-0pky"><input type="text" name="lname"/></td>
                </tr>

                <tr>
                    <td class="tg-0pky"><label>User Name </label></td>
                    <td class="tg-0pky"><input type="text" name="uname"/></td>
                </tr>

                <tr>
                    <td class="tg-0pky"><label>Password </label></td>
                    <td class="tg-0pky"><input type="password" name="password"/></td>
                </tr>

                <tr>
                    <td class="tg-0pky"><label>Email </label></td>
                    <td class="tg-0pky"><input type="email" name="email"/></td>
                </tr>
                <tr>
                    <td class="tg-0pky"><label>Phone Number </label></td>
                    <td class="tg-0pky"><input type="tel" name="phone"/></td>
                </tr>

                <tr>
                    <td class="tg-0pky" colspan="2"><button class="button" type="submit">Register</button></td>
                </tr>
                <tr>
                    <td class="tg-0pky" colspan="2"><h3><a href="index.html">Return to Dashboard</a></h3></td>
                </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>