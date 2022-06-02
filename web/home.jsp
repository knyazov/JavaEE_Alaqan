<%@ page import="java.util.ArrayList" %>
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
                ArrayList<Foods> foods = (ArrayList<Foods>) request.getAttribute("foods");
                if (foods != null) {
                    for (Foods f :
                            foods) {
            %>

            <div class="card" style="width: 18rem;">
                <img src="<%=f.getPhoto()%>" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title"><%=f.getName()%>></h5>
                    <p class="card-text"><%=f.getDescription()%></p>
                    <a href="#" class="btn btn-primary">DETAILS</a>
                </div>
            </div>

            <%
                    }
                }
            %>
        </div>
    </div>
</div>

</body>
</html>
