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
        <div class="col-6 mx-auto">
            <form action="/addFood" method="post">
                <div class="row">
                    <div class="col-12">
                        <label>NAME : </label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <input type="text" class="form-control" name="name">
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <label>PHOTO : </label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <input type="text" class="form-control" name="photo">
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <label>DESCRIPTION : </label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <textarea name="description"></textarea>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <label>PRICE : </label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <input type="text" class="form-control" name="price">
                    </div>
                </div>
                <button class="btn btn-success">ADD FOOD</button>
            </form>
        </div>
    </div>
</div>

</body>
</html>
