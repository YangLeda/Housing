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
    <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet">

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"
            integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
            crossorigin="anonymous"></script>

    <title>Upload New House</title>
</head>
<body>

<script>
    $(document).ready(function () {
        $("input#file").change(function () {
            var ele = document.getElementById($(this).attr('id'));
            var result = ele.files;
            for (var x = 0; x < result.length; x++) {
                var fle = result[x];
                var val = fle.name.toLowerCase();
                var regex = new RegExp("(.*?)\.(jpg|png)$");
                if (!(regex.test(val))) {
                    $(this).val('');
                    alert('Please upload only .jpg or .png file!');
                }
            }
        });
    });
</script>

<!-- container -->
<div class="container">
    <!-- header -->
    <jsp:include page="header.jsp"></jsp:include>
    <!-- header -->

    <div class="container">
        <br>
        <h2>Upload Your Property</h2>
        <br>

        <form method="post" action="upload_house_process" enctype="multipart/form-data">
            <div class="form-group">
                <label for="address"><b>Address</b></label>
                <input type="text" class="form-control" id="address" name="address" placeholder="Enter the address"
                       required
                       autofocus>
            </div>

            <div class="form-group">
                <label for="price"><b>Price</b></label>
                <input type="text" id="price" name="price" class="form-control" placeholder="price" required autofocus>
            </div>

            <div class="form-row align-items-center">
                <div class="col-auto">
                    <label for="bedrooms"><b>Bedrooms&nbsp;</b></label>
                    <select id="bedrooms" name="bedrooms">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </div>
                <div class="col-auto">
                    <label for="bathrooms"><b>Bathrooms&nbsp;</b></label>
                    <select id="bathrooms" name="bathrooms">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </div>
                <div class="col-auto">
                    <label for="bedrooms"><b>Carparks</b></label>
                    <select id="carparks" name="carparks">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </div>
            </div>
            <br>

            <div class="form-group">
                <label for="file"><b>Upload photos</b></label>
                <input type="file" class="form-control-file" name="file" id="file" multiple>
                <p>.jpg or .png files under 5MB only.</p>
            </div>
            <br>

            <div class="form-group">
                <label for="description"><b>Description</b></label>
                <textarea class="form-control" id="description" name="description" rows="10"></textarea>
            </div>

            <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
            <br>
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