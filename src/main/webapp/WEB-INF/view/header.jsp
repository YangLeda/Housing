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
                    <a class="nav-link" href="/landlord">Landlord</a>
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