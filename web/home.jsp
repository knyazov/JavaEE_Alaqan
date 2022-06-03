<%@ page import="java.util.ArrayList" %>
<%@ page import="Entities.Foods" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html>
<head>
    <%@include file="vendor/header.jsp" %>

</head>
<body>
<%@include file="vendor/navbar.jsp" %>

<div class="container">
    <div class="row mt-3">
        <div class="col-12 mx-auto">
            <div class="row row-cols-1 row-cols-md-3 g-3">

                <%
                    ArrayList<Foods> foods = (ArrayList<Foods>) request.getAttribute("foods");
                    if (foods != null && online) {
                        for (Foods f :
                                foods) {
                %>
                <div class="col">
                    <div class="card h-100">
                        <input type="hidden" name="id" value="<%=f.getId()%>">
                        <img src="<%=f.getPhoto()%>>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title"><%=f.getName()%>
                            </h5>
                            <p class="card-text"><%=f.getDescription()%>
                            </p>
                            <br>
                            <p>ADDED BY <%=f.getUser().getName()%>
                            </p>
                            <br>
                            <p>ON <%=f.getPaste_date()%>
                            </p>
                            <button type="submit" class="btn btn-primary" data-bs-toggle="modal"
                                    data-bs-target="#editModal"> EDIT
                            </button>
                        </div>


                    </div>
                </div>

                <!-- Modal -->

                <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content p-2">
                            <form action="/editFood" method="post">
                                <input type="hidden" name="id" value="<%=f.getId()%>">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">EDITING FOOD</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="col">
                                    <div class="card h-100">

                                        <div class="row">
                                            <div class="col-12">
                                                <label>NAME : </label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <input type="text" class="form-control" name="name"
                                                       value="<%=f.getName()%>">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <label>PHOTO : </label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <input type="text" class="form-control" name="photo"
                                                       value="<%=f.getPhoto()%>">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <label>DESCRIPTION : </label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <textarea name="description"><%=f.getDescription()%></textarea>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <label>PRICE : </label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <input type="text" class="form-control" name="price"
                                                       value="<%=f.getPrice()%>">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close
                                    </button>
                                    <button type="submit" class="btn btn-primary">Save changes</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <%
                    }
                } else if (foods != null) {
                %>
                <%

                    for (Foods f :
                            foods) {
                %>
                <div class="col">
                    <div class="card h-100">
                        <img src="<%=f.getPhoto()%>>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title"><%=f.getName()%>
                            </h5>
                            <p class="card-text"><%=f.getDescription()%>
                            </p>
                            <br>
                            <p>ADDED BY <%=f.getUser().getName()%>
                            </p>
                            <br>
                            <p>ON <%=f.getPaste_date()%>
                            </p>
                        </div>
                    </div>
                </div>
                <%
                        }
                    }
                %>

            </div>
        </div>
    </div>
</div>

</body>
</html>
