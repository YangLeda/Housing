<%--
  Created by IntelliJ IDEA.
  User: Yang
  Date: 27/9/17
  Time: 1:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<html>
<head>
    <title>Register</title>
</head>
<body>
<center>
    <h1>Create an account</h1>
    <form action="register_check.jsp" method="post">
        <table>
            <tr>
                <td>Email</td>
                <td><input type="text" name="user"></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name="pwd"> The password must be less than 6 digits</td>
            </tr>
            <tr>
                <td>Full name</td>
                <td><input type="text" name="fullname"></td>
            </tr>
            <tr>
                <td>Gender</td>
                <td><input type="radio" name="sex" value="male">Male
                    <input type="radio" name="sex" value="Female">Femal</td>
            </tr>
            <tr>
                <td>Submit your photo ID</td>
                <td><input  type="file"></td>
            </tr>

            <tr>
                <td><input type="submit" value="Submit" onClick="window.location.href='register_show.jsp'"></td>
                <td><input type="submit" value="Cancel" onClick="window.location.href='main.jsp'"></td>

            </tr>
        </table>
    </form>
</center>
</body>
</html>