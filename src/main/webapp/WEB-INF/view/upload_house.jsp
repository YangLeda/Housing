<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Upload New House</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link type="text/css" rel="stylesheet" href="/resources/boostrap/css/bootstrap.css">
    <link type="text/css" rel="stylesheet" href="/resources/boostrap/font-awesome/css/font-awesome.min.css">
    <link type="text/css" rel="stylesheet" href="/resources/boostrap/css/datepicker.css">
    <link type="text/css" rel="stylesheet" href="/resources/includes/css/style-room-single-1.css">
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
                                <h1>Upload New House</h1>
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
                    <form method="post" action="upload_house_process" enctype="multipart/form-data">
                        <div>
                            <p>Address</p>
                            <input type="text" name="address" class="form-control" placeholder="Enter the address" required
                                   autofocus>
                        </div>

                        <div>
                            <p>Price</p>
                            <input type="text" name="price" class="form-control" placeholder="price" required autofocus>
                        </div>

                        <div>
                            <div class="form-check form-check-inline">
                                <p> Bedrooms:</p>
                            </div>
                            <div class="form-check form-check-inline">
                                <select name="bedrooms" class="form-control">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </div>

                            <div class="form-check form-check-inline">
                                <p>Bathrooms:</p>
                            </div>
                            <div class="form-check form-check-inline">
                                <select name="bathrooms" class="form-control">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </div>

                            <div class="form-check form-check-inline">
                                <p>Carparks:</p>
                            </div>
                            <div class="form-check form-check-inline">
                                <select name="carparks" class="form-control">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </div>
                        </div>

                        <div>
                            <p>Picture</p>
                            <input type="file" name="file" id="file" multiple>
                            <p>.jpg or .png files under 5MB only.</p>
                        </div>

                        <div class="form-check form-check-inline">
                            <p>Description</p>
                            <textarea type="text" cols="10" rows="10" name="description" class="form-control" placeholder="Enter your description" required
                                      autofocus></textarea>
                        </div>

                        <div class="spacefix">
                            <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
                        </div>
                    </form>

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
                                <p>15 Broadway, Ultimo NSW 2007</p>
                                <p>(+064) - 342 - 68273  — (+064) - 342 - 68273 </p>
                                <p>info@gmail.com</p>
                                <p>http://XXXX.com</p>
                            </div>
                            <div class="iconicons">
                                <ul>
                                    <li><a href="#"><i class="ion-social-facebook"></i></a></li>
                                    <li><a href="#"><i class="ion-social-twitter"></i></a></li>
                                    <li><a href="#"><i class="ion-social-googleplus"></i></a></li>
                                    <li><a href="#"><i class="ion-social-pinterest-outline"></i></a></li>
                                    <li><a href="#"><i class="ion-social-instagram-outline"></i></a></li>
                                    <li><a href="#"><i class="ion-social-youtube-outline"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 no-right">
                        <div id="newsletter">
                            <h4>News Letter</h4>
                            <p>Cras dignissim, velit ut placerat pulvinar, metus justo ultricies lacus, ut consectetur neque augue maximus lectus. Phasellus non placerat nibh.</p>

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
</html>