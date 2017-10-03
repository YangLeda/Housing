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

    <title>House detail</title>
</head>
<body>

<script>
    $(document).ready(function () {
        $('#carousel').find('.carousel-item').first().addClass('active');
    });
</script>

<!-- container -->
<div class="container">
    <!-- header -->
    <jsp:include page="header.jsp"></jsp:include>
    <!-- header -->


    <div class="row">
        <!-- pics -->
        <div class="col-md-6">
            <div id="carousel" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <c:forEach var="img" items="${imgs}">
                        <div class="carousel-item">
                            <img class="d-block w-100" src="${img.path}">
                        </div>
                    </c:forEach>
                </div>
                <a class="carousel-control-prev" href="#carousel" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carousel" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
        <!-- pics -->

        <!-- detail -->
        <div class="col-md-6">
            <h5>Address</h5> ${house.address}

            <h5>Price</h5> ${house.price}

            <h5> Bedrooms:</h5> ${house.bedrooms}

            <h5>Bathrooms:</h5> ${house.bathrooms}

            <h5>Carparks:</h5> ${house.carparks}

            <h5>Description:</h5> ${house.description}

            <br><br>
            <form method="post" action="submit_application">
                <input type="hidden" name="houseid" value="${house.id}">
                <input type="hidden" name="landlordid" value="${house.landlordid}">
                <h5>Leave a Message</h5>
                <textarea style="min-width: 100%" rows="10" name="message"></textarea>
                <h5>Your phone number</h5>
                <input type="text" name="phone" class="form-control" required>
                <h5>Your email</h5>
                <input type="text" name="email" class="form-control" required>
                <br>
                <button class="btn btn-lg btn-primary btn-block" type="submit">Apply</button>
            </form>

        </div>
        <!-- detail -->
    </div>


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