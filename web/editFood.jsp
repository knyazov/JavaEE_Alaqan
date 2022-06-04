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
        <div class="col-6 mx-auto mb-3">

            <%
                Foods food = (Foods) request.getAttribute("food");
                if (food != null) {
            %>
            <div class="col-sm-12 offset-3 mx-auto">

                <%
                    String success = request.getParameter("success");
                    if (success != null) {
                %>
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    FOOD UPDATED SUCCESSFULLY
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <%
                    }
                %><%
                String wrong = request.getParameter("wrong");
                if (wrong != null) {
            %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    FOOD NOT SAVED
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <%
                    }
                %>

                <form action="/editFood" method="post">
                    <input type="text" name="id" value="<%=food.getId()%>">
                    <div class="row">
                        <div class="col-12">
                            <label>NAME : </label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <input type="text" class="form-control" name="name" value="<%=food.getName()%>">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <label>PHOTO : </label>
                        </div>
                    </div><div class="row">
                        <div class="col-12">
                            <img src="<%=food.getPhoto()%>">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <input type="text" class="form-control" name="photo" value="<%=food.getPhoto()%>">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <label>DESCRIPTION : </label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <textarea name="description"><%=food.getDescription()%></textarea>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <label>PRICE : </label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <input type="text" class="form-control" name="price" value="<%=food.getPrice()%>">
                        </div>
                    </div>
                    <button class="btn btn-success">SAVE FOOD</button>

                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteFoodModal">
                        DELETE FOOD FROM DB
                    </button>
                </form>
                <div class="modal fade" id="deleteFoodModal" tabindex="-1" role="dialog"
                     aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <form action="/deleteFood" method="post">
                                <input type="hidden" name="id" value="<%=food.getId()%>">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">DELETING</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    ARE YOU SURE?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">NOPE</button>
                                    <button type="submit" class="btn btn-danger">YEP</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
            <%
                }
            %>
        </div>
    </div>
</div>
</body>
</html>
