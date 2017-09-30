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

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"
            integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
            crossorigin="anonymous"></script>

    <title>Housing</title>
</head>

<body>

<script>
    <!-- select searching choices -->
    $(document).ready(function () {
        document.getElementById('min_bedrooms').value = "${min_bedrooms}";
        document.getElementById('min_bathrooms').value = "${min_bathrooms}";
        document.getElementById('min_carparks').value = "${min_carparks}";
        document.getElementById('min_price').value = "${min_price}";
        document.getElementById('max_price').value = "${max_price}";
    });
</script>

<!-- container -->
<div class="container">

    <!-- header -->
    <jsp:include page="header.jsp"></jsp:include>
    <!-- header -->

    <div class="row">
        <!-- search -->
        <div class="col-md-3">
            <form method="get" action="/search">
                <h4>Search</h4>
                <br>
                <div class="row">
                    <div class="col">
                        <h5>Min Beds</h5>
                        <select class="" name="min_bedrooms" id="min_bedrooms">
                            <option value="0">any</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </div>
                    <div class="col">
                        <h5>Min Baths</h5>
                        <select class="" name="min_bathrooms" id="min_bathrooms">
                            <option value="0">any</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col">
                        <h5>Min Carparks</h5>
                        <select class="" name="min_carparks" id="min_carparks">
                            <option value="0">any</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                        </select>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col">
                        <h5>Min Price</h5>
                        <select class="" name="min_price" id="min_price">
                            <option value="0">any</option>
                            <option value="100">$100</option>
                            <option value="200">$200</option>
                            <option value="300">$300</option>
                            <option value="400">$400</option>
                            <option value="500">$500</option>
                            <option value="600">$600</option>
                            <option value="700">$700</option>
                            <option value="800">$800</option>
                            <option value="900">$900</option>
                            <option value="1000">$1000</option>
                        </select>
                    </div>
                    <div class="col">
                        <h5>Max Price</h5>
                        <select class="" name="max_price" id="max_price">
                            <option value="9999">any</option>
                            <option value="100">$100</option>
                            <option value="200">$200</option>
                            <option value="300">$300</option>
                            <option value="400">$400</option>
                            <option value="500">$500</option>
                            <option value="600">$600</option>
                            <option value="700">$700</option>
                            <option value="800">$800</option>
                            <option value="900">$900</option>
                            <option value="1000">$1000</option>
                        </select>
                    </div>
                </div>
                <br>
                <div class="">
                    <input class="btn btn-primary" type="submit" value="Go">
                </div>
            </form>
        </div>

        <!-- search -->


        <!-- list -->
        <div class="col-md-9">
            <div class="alert alert-success" role="alert">
                ${num} results found.
            </div>

            <c:forEach var="house" items="${houses}">
                <div class="card">
                    <img class="card-img-top" src="${house.pic}">
                    <div class="card-body">
                        <h4 class="card-title">${house.address} &#124; $${house.price}</h4>
                        <p class="card-text">${house.description}</p>
                        <a href="/house_detail?id=${house.id}" class="btn btn-primary">More Detail</a>
                    </div>
                </div>
                <br><br>
            </c:forEach>
        </div>
        <!-- list -->
    </div>

    <!-- footer -->
    <jsp:include page="footer.jsp"></jsp:include>
    <!-- footer -->

</div>
<!-- container -->


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