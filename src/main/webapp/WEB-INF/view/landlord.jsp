<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Landlord</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link type="text/css" rel="stylesheet" href="/resources/boostrap/css/bootstrap.css">
    <link type="text/css" rel="stylesheet" href="/resources/boostrap/font-awesome/css/font-awesome.min.css">
    <link type="text/css" rel="stylesheet" href="/resources/boostrap/css/datepicker.css">
    <link type="text/css" rel="stylesheet" href="/resources/includes/css/style-room-single-1.css">
    <link type="text/css" rel="stylesheet" href="/resources/includes/css/booking-3.css">
    <link type="text/css" rel="stylesheet" href="/resources/includes/css/footer.css"/>
    <link type="text/css" rel="stylesheet" href="/resources/includes/css/header.css"/>
    <link type="text/css" rel="stylesheet" href="/resources/includes/css/blog-single.css">
    <link href='http://fonts.googleapis.com/css?family=Playfair+Display:400,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link type="text/css" rel="stylesheet" href="/resources/includes/css/ionicons.min.css">
</head>
<body class="stretched dark side-push-panel">
<div class="body-overlay"></div>
<div id="side-panel" class="dark">
    <div id="side-panel-trigger-close" class="side-panel-trigger"><a href="#"><i class="fa fa-times"></i></a></div>
    <div class="side-panel-wrap">
        <ul class="navbar mm-panel">
            <li><a href="/">Home</a></li>
            <li><a href="/student">Student</a></li>
            <li><a href="/landlord">Landlord</a></li>

        </ul>
    </div>
</div>
<div id="wrapper" class="clearfix">
    <div id="mobile-bar" class="visible-xs visible-sm">
        <a href="#" id="offcanvas-togglers" class="menu-trigger"><i class="fa fa-bars"></i></a>
        <h1 class="mob-title"><a href="/">Home</a></h1>
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
                                        <li ><a href="/">Home <span class="sr-only">(current)</span></a></li>
                                        <li ><a href="/student">Student</a></li>
                                        <li class="active"><a href="/landlord">Landlord</a></li>

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
                <div class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <img src="/resources/images/bg-header.png" alt="img Luxury room">
                            <div class="carousel-caption hidden-xs hidden-sm">
                                <h1>List of uploaded houses</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section> <!--.slider-box -->
    <main id="main-content">
        <div class="container">
            <div class="row"  id="content"><!--Begin #content-->
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 content">
                    <a href="/upload_house" class="btn btn-info btn-lg">
                        <span class="glyphicon glyphicon-plus"></span> Upload Property
                    </a>
    </p>
    <br><br>
    <h2>Received Applications:</h2>
    <c:forEach var="application" items="${applicationShows}">
        <c:set var="status" value="${application.status}" scope="request"/>
        <br>
        <div class="card">
            <div class="card-header">
                <b>${application.address}</b>
            </div>
            <div class="card-body">
                <p class="card-text">
                    <b>Bedrooms: </b>${application.bedrooms}<br>
                    <b>Bathrooms: </b>${application.bathrooms}<br>
                    <b>Carparks: </b>${application.carparks}<br>
                    <b>Price: </b>${application.price}<br>
                    <b>Message: </b>${application.message}<br>
                    <b>Apply time: </b>${application.time}<br>
                    <b>Status:</b>
                    <c:if test="${ status  == 'Pending'}">
                        <span class="badge badge-secondary">${application.status}</span>
                    </c:if>
                    <c:if test="${ status  == 'Approved'}">
                        <span class="badge badge-success">${application.status}</span>
                    </c:if>
                    <c:if test="${ status  == 'Rejected'}">
                        <span class="badge badge-danger">${application.status}</span>
                    </c:if>
                </p>
                <c:if test="${ status  == 'Pending'}">
                    <a class="btn btn-success"
                       href="#"
                       data-toggle="modal" data-target="#approvemodal_${application.id}">Approve</a>
                    <a class="btn btn-danger"
                       href="#"
                       data-toggle="modal" data-target="#rejectmodal_${application.id}">Reject</a>
                </c:if>
            </div>
        </div>
        <br>
        <!-- Modal approve-->
        <div class="modal fade" id="approvemodal_${application.id}" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Housing</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Approve this application?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-success"
                           href="/decide?decision=Approved&applicationid=${application.id}">Approve</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal reject-->
        <div class="modal fade" id="rejectmodal_${application.id}" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Housing</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Reject this application?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-danger"
                           href="/decide?decision=Rejected&applicationid=${application.id}">Reject</a>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>

    <br><br>
    <h2>Your Properties:</h2>
    <c:forEach var="house" items="${houses}">
        <br>
        <div class="card">
            <div class="card-header">
                <b>${house.address}</b>
            </div>
            <div class="card-body">
                <b>Price: </b>${house.price}<br>
                <b>Bedrooms: </b>${house.bedrooms}<br>
                <b>Bathrooms: </b>${house.bathrooms}<br>
                <b>Carparks: </b>${house.carparks}<br>
                <br>
                <a class="btn btn-danger"
                   href="#"
                   data-toggle="modal" data-target="#housemodal_${house.id}">Delete</a>
            </div>
        </div>
        <br>
        <!-- Modal -->
        <div class="modal fade" id="housemodal_${house.id}" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Housing</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Delete this property?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-danger"
                           href="/delete_house?houseId=${house.id}">Confirm</a>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>


                </div>

            </div>
        </div>
    </main><!--End #main-->

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
<script type="text/javascript" src="/resources/boostrap/js/bootstrap.js"></script>
<script type="text/javascript" src="/resources/boostrap/js/moment.js"></script>
<script type="text/javascript" src="/resources/boostrap/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/resources/includes/js/plugins.js"></script>
<script type="text/javascript" src="/resources/includes/js/room-single-1.js" ></script>
<script type="text/javascript" src="/resources/includes/js/functions.js"></script>
<script type="text/javascript" src="/resources/includes/js/home.js"></script>
<script type="text/javascript" src="/resources/includes/js/jquery.elevatezoom.js"></script>
<script type="text/javascript" src="/resources/includes/js/room-1.js" ></script>
</body>
