<%--
  Created by IntelliJ IDEA.
  User: 张润彬
  Date: 2017/9/27
  Time: 12:26
  To change this template use File | Settings | File Templates.
--%>
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
    <link href="/resources/css/main.css" rel="stylesheet">
    <title>Release New House</title>
</head>
<body>
<!-- container -->
<div class="container">
    <!-- header -->
    <jsp:include page="header.jsp"></jsp:include>
    <!-- header -->

    <div class="container">
        <form method="post" action="upload_house_process" enctype="multipart/form-data">
            <div>
                <h5>Address</h5>
                <input type="text" name="address" class="form-control" placeholder="Enter the address" required
                       autofocus>
            </div>

            <div>
                <h5>Price</h5>
                <input type="text" name="price" class="form-control" placeholder="price" required autofocus>
            </div>

            <div>
                <div class="form-check form-check-inline">
                    <h5> Bedrooms:</h5>
                </div>
                <div class="form-check form-check-inline">
                    <select name="bedrooms">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </div>

                <div class="form-check form-check-inline">
                    <h5>Bathrooms:</h5>
                </div>
                <div class="form-check form-check-inline">
                    <select name="bathrooms">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </div>

                <div class="form-check form-check-inline">
                    <h5>Carparks:</h5>
                </div>
                <div class="form-check form-check-inline">
                    <select name="carparks">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </div>
            </div>

            <div>
                <h5>Picture</h5>
                <input type="file" name="file">
            </div>

            <div class="form-check form-check-inline">
                <h5>Description</h5>
                <input type="text" name="description" class="form-control" placeholder="Enter your description" required
                       autofocus>
            </div>

            <div class="spacefix">
                <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
            </div>
        </form>

        <!-- footer -->
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- footer -->

    </div>
    <!-- /container -->

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