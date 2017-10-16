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
    <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet">
</head>
<body>

<div class="container">
    <!-- header -->
    <jsp:include page="header.jsp"></jsp:include>
    <!-- header -->
    <br>
    <p>
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
                    <b>Price: </b>${application.price}<br>
                    <b>Student Name: </b>${application.name}<br>
                    <b>Message: </b>${application.message}<br>
                    <b>Phone: </b>${application.phone}<br>
                    <b>Email: </b>${application.email}<br>
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
                        <h5 class="modal-title" id="exampleModalLabel">Approve application</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form method="post" action="decide?decision=Approved">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="approve_message">Leave a message to the student:</label>
                                <textarea class="form-control" id="approve_message" name="message" rows="3"></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" name="applicationid" value="${application.id}">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-success">Approve</button>
                        </div>
                    </form>
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
                        <h5 class="modal-title" id="exampleModalLabel">Reject application</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form method="post" action="decide?decision=Rejected">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="reject_message">Leave a message to the student:</label>
                                <textarea class="form-control" id="reject_message" name="message" rows="3"></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" name="applicationid" value="${application.id}">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-danger">Reject</button>
                        </div>
                    </form>
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