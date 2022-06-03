<%@ page import="Entities.Foods" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="vendor/header.jsp" %>
</head>
<body>
<%@include file="vendor/navbar.jsp" %>

<div class="container">
    <div class="row mt-3">
        <div class="col-6 mx-auto">

            <%
                String success = request.getParameter("success");
                if (success != null) {
            %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                 EDITED successfully
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <%
                }
            %><%
            String wrong = request.getParameter("wrong");
            if (wrong != null) {
        %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                NOT SAVED
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <%
                }
            %>


            <%
                Foods food = (Foods) request.getAttribute("food");
                if (food != null) {
            %>

            <form action="/editFood" method="post">
                <input type="hidden" name="id" value="<%=food.getId()%>">
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
            </form>

            <%
                }
            %>

        </div>
    </div>
</div>

</body>
</html>
