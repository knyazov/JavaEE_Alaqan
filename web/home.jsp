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
        <div class="col-12 mx-auto"><div class="row row-cols-1 row-cols-md-3 g-3">
            <%
                ArrayList<Foods> foods = (ArrayList<Foods>) request.getAttribute("foods");
                if (foods != null) {
                    for (Foods f :
                            foods) {
            %>
                <div class="col">
                    <div class="card h-100">
                        <img src="<%=f.getPhoto()%>>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title"><%=f.getName()%></h5>
                            <p class="card-text"><%=f.getDescription()%></p>
                            <br>
                            <p>ADDED BY <%=f.getUser().getName()%></p>
                            <br>
                            <p>ON <%=f.getPaste_date()%></p>
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
