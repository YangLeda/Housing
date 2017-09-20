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
    <link href="/resources/css/style.css" rel="stylesheet">

    <title>For Rent</title>
</head>

<body>


<!-- header -->
<div class="header-section">
    <div class="container">
        <div class="head-top">
            <div class="email">
                <ul>
                    <li><i class="glyphicon glyphicon-log-in" aria-hidden="true"></i><a href="#" data-toggle="modal"
                                                                                        data-target="#myModal">Login</a>
                    </li>
                </ul>
            </div>
            <div class="clearfix"></div>
        </div>

        <nav class="navbar navbar-default">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">

                <div class="navbar-brand">
                    <h1><a href="index.html"><span>UTS Rental</span></a></h1>
                </div>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="index.html">Home <span class="sr-only">(current)</span></a></li>
                    <li><a href="forrent.html">Rent</a></li>
                    <li><a href="about.html">About</a></li>
                </ul>

            </div>
        </nav>
    </div>
</div>
<!-- header -->


<!-- banner -->
<div class="banner-section">
    <div class="container">
        <h2>For Rent</h2>
    </div>
</div>
<!-- banner -->


<!-- content -->
<div class="content">
    <div class="properties-section">
        <div class="container">
            <div class="properties-grids">


                <!-- search -->
                <div class="col-md-3 properties-right">
                    <div class="properties-top">
                        <h4>Find Your Place</h4>
                        <div class="yourplace-grids">
                            <div class="col-md-6 yourplace-grid">
                                <h5>Min Beds</h5>
                                <select class="sel3">
                                    <option value="">any</option>
                                    <option value="">1</option>
                                    <option value="">2</option>
                                    <option value="">3</option>
                                    <option value="">4</option>
                                    <option value="">5</option>
                                </select>
                            </div>
                            <div class="col-md-6 yourplace-grid">
                                <h5>Min Baths</h5>
                                <select class="sel3">
                                    <option value="">any</option>
                                    <option value="">1</option>
                                    <option value="">2</option>
                                    <option value="">3</option>
                                    <option value="">4</option>
                                    <option value="">5</option>
                                </select>
                            </div>
                        </div>
                        <div class="yourplace-grids1">
                            <div class="col-md-6 yourplace-grid">
                                <h5>Min Price</h5>
                                <select class="sel3">
                                    <option value="">any</option>
                                    <option value="">$500</option>
                                    <option value="">$1000</option>
                                    <option value="">$2000</option>
                                    <option value="">$3000</option>
                                    <option value="">$4000</option>
                                    <option value="">$5000</option>
                                    <option value="">$75000</option>
                                    <option value="">$10000</option>
                                </select>
                            </div>
                            <div class="col-md-6 yourplace-grid">
                                <h5>Max Price</h5>
                                <select class="sel3">
                                    <option value="">any</option>
                                    <option value="">$1000</option>
                                    <option value="">$2000</option>
                                    <option value="">$3000</option>
                                    <option value="">$4000</option>
                                    <option value="">$5000</option>
                                    <option value="">$75000</option>
                                    <option value="">$10000</option>
                                </select>
                            </div>
                        </div>
                        <div class="search1">
                            <form>
                                <input type="submit" value="Search">
                            </form>
                        </div>
                    </div>
                </div>
                <!-- search -->


                <div class="col-md-9 forsales-left">
                    <div class="forsale">
                        <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
                            <div id="myTabContent" class="tab-content">
                                <div role="tabpanel" class="tab-pane fade in active" id="home"
                                     aria-labelledby="home-tab">
                                    <div class="forsale-grids">
                                        <h4><a href="#">1200 Anastasia Avenue, Coral Gables</a></h4>
                                        <div class="forsale1">
                                            <div class="forsale-left">
                                                <a href="#"><img src="/resources/img/p6.jpg" class="img-responsive" alt="/"></a>
                                            </div>
                                            <div class="forsale-right">
                                                <h5><label>$</label> 7,500 Per Month - <span>Single Family Home</span>
                                                </h5>
                                                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam
                                                    nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat
                                                    volutpat. Ut wisi enim ad……</p>
                                                <a href="#" class="button4">more details</a>
                                            </div>
                                            <div class="clearfix"></div>
                                            <ul>
                                                <li><span> 5000 </span>Area</li>
                                                <li><span> 3 </span>Bathrooms</li>
                                                <li><span> 3 </span>Bedrooms</li>
                                                <li><span> 2 </span>Garages</li>
                                            </ul>
                                        </div>
                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>
</div>
<!-- content -->


<!-- footer -->
<div class="footer-section">
    <div class="container">
        <div class="col-md-3 footer-grid">
            <h4>Get In Touch</h4>
            <p>Telephone : +61 401 312 000</p>
            <p>E-mail : <a href="mailto:utshousing@uts.com"> utshousing@uts.com</a></p>
        </div>
    </div>
</div>
</div>
<!-- footer -->


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