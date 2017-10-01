<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
          integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <!-- Custom CSS -->
    <link href="/resources/css/login_error.css" rel="stylesheet">
    <link href="/resources/css/main.css" rel="stylesheet">
    <title>Login fail</title>
</head>
<body>
<div class="container">
     <!-- header -->
    <jsp:include page="header.jsp"></jsp:include>
    <!-- header -->

     <div class="center-in-center">
         <div>
         <h1 class="text-center"> ERROR: Login fail! Please chick your username and password.</h1>

      </div>
         <div class="center-in-row">
         <button href="/login" type="button" class="btn btn-primary btn- btn-lg" >Go back</button>
     </div>
     </div>
     </div>
</body>
</html>