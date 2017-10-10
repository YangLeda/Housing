<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
          integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">

    <title>Admin</title>
</head>
<body>

<div class="container">

    <a class="nav-link float-right" href="/logout">Logout</a>

    <br>
    <h2 class="mx-auto">List of houses</h2>

    <table class="table table-striped table-hover">
        <thead class="thead-inverse">
        <tr>
            <th>ID</th>
            <th>Address</th>
            <th>Bedrooms</th>
            <th>Bathrooms</th>
            <th>Description</th>
            <th>Price</th>
            <th>LandlordID</th>
            <th>Delete</th>
        </tr>
        </thead>
        <c:forEach items="${houses}" var="house">
            <tr>
                <th scope="row">${house.id}</th>
                <td>${house.address}</td>
                <td>${house.bedrooms}</td>
                <td>${house.carparks}</td>
                <td>${house.description}</td>
                <td>${house.price}</td>
                <td>${house.landlordid}</td>
                <td><a href="/admindelete_house?houseId=${house.id}"
                       onclick="return confirm('Delete this house?')">Delete</a></td>
            </tr>
        </c:forEach>
    </table>

    <br>
    <h2>List of applications</h2>

    <table class="table table-striped table-hover">
        <thead class="thead-inverse">
        <tr>
            <th>ID</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Message</th>
            <th>Time</th>
            <th>HouseID</th>
            <th>StudentID</th>
            <th>LandlordID</th>
            <th>Status</th>
            <th>Delete</th>
        </tr>
        </thead>
        <c:forEach items="${applications}" var="application">
            <tr>
                <th scope="row">${application.id}</th>
                <td>${application.phone}</td>
                <td>${application.email}</td>
                <td>${application.message}</td>
                <td>${application.time}</td>
                <td>${application.houseid}</td>
                <td>${application.studentid}</td>
                <td>${application.landlordid}</td>
                <td>${application.status}</td>
                <td><a href="/admindelete_application?applicationId=${application.id}"
                       onclick="return confirm('Delete this application?')">Delete</a></td>
            </tr>
        </c:forEach>
    </table>

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
