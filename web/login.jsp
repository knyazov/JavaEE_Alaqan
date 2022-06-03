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
                String passwordError = request.getParameter("passwordError");
                if (passwordError != null) {
            %>
            <div class="alert alert-danger" role="alert">
                <h4 class="alert-heading">Password is ERROR!</h4>
            </div>
            <%
                }
            %>
            <%
                String emailError = request.getParameter("emailError");
                if (emailError != null) {
            %>
            <div class="alert alert-danger" role="alert">
                <h4 class="alert-heading">Email is ERROR!</h4>
            </div>
            <%
                }
            %>

            <form action="/auth" method="post">
                <div class="row mt-3">
                    <div class="col-12">
                        <label>EMAIL</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <input type="email" class="form-control" placeholder="email" required name="email">
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-12">
                        <label>PASSWORD</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <input type="password" class="form-control" placeholder="password" required name="password">
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-12">
                        <button type="submit" class="btn btn-primary">
                            LOGIN
                        </button>

                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
