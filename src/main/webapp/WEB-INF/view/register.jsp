<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
          integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <!-- Custom CSS -->
    <link href="<c:url value="/resources/css/register.css"/>" rel="stylesheet">
    <title>Register</title>
</head>

<body>
<div class="container">
    <form class="form-signin" method="post" action="register_process">
        <h2>Create an account</h2>
        <br>

        <div class="form-check form-check-inline">
            <h5> Username:</h5>
            <input class="form-control" type="text" name="username">
            <br>

            <h5>Password:</h5>
            <div>
                <input class="form-control" type="password" name="password">
                <h7>Password must be at least 6 characters.</h7>
            </div>
            <br>

            <h5>Full name:</h5>
            <input class="form-control" type="text" name="fullname">

            <h5>Email:</h5>
            <input class="form-control" type="email" name="email">
        </div>

        <div>
            <input class="btn btn-lg btn-primary btn-block" type="submit" value="Submit">
        </div>
    </form>
</div>


<!-- Optional JavaScript -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
        integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
        integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
        crossorigin="anonymous"></script>
</body>
</html>