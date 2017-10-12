<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title> Housing </title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
          integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <link type="text/css" rel="stylesheet" href="/resources/boostrap/font-awesome/css/font-awesome.min.css">
    <link type="text/css" rel="stylesheet" href="/resources/includes/css/style-room-1.css"/>
    <link type="text/css" rel="stylesheet" href="/resources/includes/css/footer.css"/>
    <link type="text/css" rel="stylesheet" href="/resources/includes/css/header.css"/>
    <link type="text/css" rel="stylesheet" href="/resources/boostrap/css/datepicker.css">
    <link href='http://fonts.googleapis.com/css?family=Playfair+Display:400,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link type="text/css" rel="stylesheet" href="/resources/includes/css/ionicons.min.css">
</head>

<body class="stretched dark side-push-panel">

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
<div class="body-overlay"></div>
<div id="side-panel" class="dark">
    <div id="side-panel-trigger-close" class="side-panel-trigger"><a href="#"><i class="fa fa-times"></i></a></div>
    <div class="side-panel-wrap">
        <ul class="navbar mm-panel">
            <li><a href="/">Home</a></li>
            <li><a  href="/student">Student</a></li>
            <li><a href="/landlord">Landlord</a></li>

        </ul>
    </div>
</div>
<div id="wrapper" class="clearfix">
    <div id="mobile-bar" class="visible-xs visible-sm">
        <a href="#" id="offcanvas-togglers" class="menu-trigger"><i class="fa fa-bars"></i></a>
        <h1 class="mob-title"><a href="main.jsp">Home</a></h1>
    </div>

    <header class="main-header">
        <div class="header-container">
            <div class="container">
                <div class="row">
                    <div class="header">
                        <div class="top-header">


                        </div><!-- .top-header -->

                        <div class="main-nav">
                            <div class="col-sm-12 col-md-4">
                                <div id="logo">
                                </div>
                            </div>
                            <div class="col-sm-4 col-md-8 nav-right  hidden-xs hidden-sm">
                                <nav>
                                    <ul class="nav navbar-nav" id="main-nav">
                                        <li class="active"><a href="/">Home <span class="sr-only">(current)</span></a></li>
                                        <li><a  href="/student">Student</a></li>
                                        <li><a href="/landlord">Landlord</a></li>

                                    </ul>
                                </nav>
                                <div class="search-bar">
                                    <%
                                        Integer id = null;
                                        String as = null;
                                        Cookie[] cookies = request.getCookies();

                                        if (cookies != null) {
                                            for (Cookie c : cookies) {
                                                if (c.getName().equals("id")) {
                                                    id = Integer.parseInt(c.getValue());
                                                }
                                                if (c.getName().equals("as")) {
                                                    as = c.getValue();
                                                }
                                            }
                                        }

                                        if (id != null && id > 0) {
                                            out.println("<span hidden>Logged in as:" + as + "</span>");
                                            out.println("<a style=\"color: white;\" class=\"nav-link\" href=\"/logout\">Logout</a>");
                                        } else {
                                            out.println("<a style=\"color: white;\" class=\"nav-link\" href=\"login\">Login</a>");
                                        }
                                    %>
                                </div>
                                <div id="btn-trigger">
                                    <a id="offcanvas-toggler" class="menu-trigger" href="#">
                                        <i class="fa fa-bars"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <hr class="hidden-xs hidden-sm">
            </div>
        </div>
    </header>
    <section class="slider-box parslide">
        <div class="slider-mask"></div>
        <div class="custom-controls">
            <div class="slider-helper">
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <img src="/resources/images/bg-header.png" alt="img Luxury room">
                            <div class="carousel-caption hidden-xs hidden-sm">
                                <h1>uts housing</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section> <!--.slider-box -->

    <!--Begin #check-room -->
    <section id="check-room">
        <div class="container">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 check-room">
                <form method="get" name="form1" id="form1" action="/search">
                    <div class="col-xs-12 col-md-9 custom-form">
                        <div class="col-xs-12 col-sm-6 col-md-2 adults group">
                            <h4>Min Beds</h4>
                            <div class="mylabel">
                                <select name="min_bedrooms" id="min_bedrooms" class="form-control">
                                    <option value="0">any</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-2 adults group">
                            <h4>Min Baths</h4>
                            <div class="mylabel">
                                <select  name="min_bathrooms" id="min_bathrooms" class="form-control">
                                    <option value="0">any</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-2 adults group">
                            <h4>Min Carparks</h4>
                            <div class="mylabel">
                                <select name="min_carparks" id="min_carparks" class="form-control">
                                    <option value="0">any</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-2 adults group">
                            <h4>Min Price</h4>
                            <div class="mylabel">
                                <select name="min_price" id="min_price" class="form-control">
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
                        </div>

                        <div class="col-xs-12 col-sm-6 col-md-2 room group">
                            <h4>Max Price</h4>
                            <div class="mylabel">
                                <select name="max_price" id="max_price" class="form-control">
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
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-3  bookbtn group">
                        <a href="javascript:;" id="btnSearch" class="btn-check"><span>Check</span><br> Availability</a>
                    </div>
                </form>
            </div>
        </div>
    </section><!--End #check-room -->

    <!-- Begin #content -->
    <main id="content">
        <div class="container">
            <hr class="hr-content">
            <div class="row" id="mainContent">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-lg-offset-3 caption-content" >
                    <h2>${num} Rooms Listing</h2>
                    <img src="/resources/images/symbol.png" alt="Room listing Hotel">
                </div>
                <section id="row-room-1"><!--Begin #row-room-1-->
                    <c:forEach  var="house" items="${houses}" varStatus="i">
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <figure class="amber-room">
                                <div class="img_zoom">
                                    <img src="${house.pic}" data-fullsrc="${house.pic}" class="img-responsive" alt="SuperiorKingRoom">
                                </div>
                                <figcaption>
                                    <a href="/house_detail?id=${house.id}"><h3 class="style_h3"><span class="title_room">${house.address} &#124;</span><em> $${house.price}</em> </h3></a>
                                    <p class="rooms-description">
                                            ${house.description}</p>
                                    <p class="rooms-description">
                                            ${house.bedrooms} Bedroomes &#124; ${house.bathrooms} Bathrooms &#124;${house.carparks}
                                        Carparks</p>
                                        <%--
                                                            <p class="infor-detail"><a  href="/house_detail?id=${house.id}"  class="btn_detail">DETAIL</a></p>
                                        --%>
                                </figcaption>
                            </figure>
                        </div>
                    </c:forEach>


                    <div class=" col-xs-12 col-sm-4 col-md-4 col-lg-4">
                        <figure id="contact-room">
                            <div id="contact">
                                <a href="#" title=""><img src="/resources/images/room/bg-contact.jpg" alt="ContactRoom Hotel" class="img-responsive"></a>
                            </div>
                            <figcaption>
                                <p id="title-contact">NEED LONG-TERM ROOM?</p>
                                <p id="phone-contact">Please contact us via hotline<br/> (+064)-342-28679</p>
                                <p id="infor-cost">just from only $1,000/month</p>
                            </figcaption>
                        </figure>
                    </div>
                </section>
            </div>
        </div>
    </main><!--End #content-->


    <!--Begin footer-->
    <footer>
        <a href="#" class="back-top"><i class="fa fa-arrow-up"></i></a>
        <div id="prefooter">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                        <div id="links">
                            <h4>Useful Links</h4>
                            <ul class="row site-links">
                                <li><a href="/"><i class="ion-minus"></i>Home</a></li>
                                <li><a href="/student"><i class="ion-minus"></i>Student</a></li>
                                <li><a href="/landlord"><i class="ion-minus"></i>Landlord</a></li>

                            </ul>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                        <div id="about">
                            <div class="logo">
                                <%--
                                                    <img src="/resources/images/logo.png" alt="">
                                --%>
                                <p>UTS Housing </p>
                            </div>
                            <div class="about-us">
                                <p>15 Broadway, Ultimo NSW 2007 </p>
                                <p>(02) 9514 2000 </p>
                                <p>info@gmail.com</p>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div id="footer">
            <p>&copy; 2015 UTS Housing &amp; Resrot. Designed with  <i class="fa fa-heart"></i>  by UTS Housing</p>
        </div>
    </footer><!--End footer-->
</div>
<script type="text/javascript" src="/resources/boostrap/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="/resources/boostrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/boostrap/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="/resources/boostrap/js/moment.js"></script>
<script type="text/javascript" src="/resources/boostrap/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/resources/includes/js/plugins.js"></script>
<script type="text/javascript" src="/resources/includes/js/functions.js"></script>
<script type="text/javascript" src="/resources/includes/js/home.js"></script>
<script type="text/javascript" src="/resources/includes/js/jquery.elevatezoom.js"></script>
<script type="text/javascript" src="/resources/includes/js/room-1.js" ></script>
</body>
</html>