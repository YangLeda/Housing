<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <link href="/resources/css/main.css" rel="stylesheet">

</head>

<body>
    <!-- header -->
    <div class="header">
        <!-- navbar -->
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
            <a class="navbar-brand" href="/">UTS Housing</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/student">Student</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/landlord">landlord</a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <%
                        Integer id = (Integer) session.getAttribute("id");
                        String as = (String) session.getAttribute("as");

                        if (id != null && id > 0) {
                            out.println("Logged in as:&nbsp" + as + "&nbsp");
                            out.println("<a href=\"/logout\">Logout</a>");
                        } else {
                            out.println("<a href=\"login\">Login</a>");
                        }
                    %>
                </form>
            </div>
        </nav>
        <!-- navbar -->

        <!-- banner -->
        <div class="banner">
            <div class="container">
                <h2>Find your home here.</h2>
            </div>
        </div>
        <!-- banner -->

    </div>
    <!-- header -->


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