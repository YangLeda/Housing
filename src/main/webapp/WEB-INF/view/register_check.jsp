<%--
  Created by IntelliJ IDEA.
  User: Yang
  Date: 27/9/17
  Time: 2:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<html>
<head>
    <title>process register info</title>
</head>
<body>
<h3>save info</h3>
<hr>
<%
    request.setCharacterEncoding("gbk");
    String username=request.getParameter("username");
    String password=request.getParameter("password");
    String fullname=request.getParameter("fullname");
    if(username.equals("")||password.equals("")){
        out.println("Username or password can not be empty! please enter again");
        response.setHeader("refresh", "3;url=register.jsp");
    }
    else if(password.length()<6){
        out.println("Password can not be less than 6! Please enter again");
        response.setHeader("refresh", "3;url=register.jsp");
    }
    else{
        session.setAttribute("username",username);
        session.setAttribute("password",password);
        session.setAttribute("fullname",fullname);
        String gender=request.getParameter("gender");
        session.setAttribute("gender", gender);
        response.sendRedirect("register_show.jsp");
    }
%>
</body>
</html>