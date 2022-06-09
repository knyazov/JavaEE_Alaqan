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
    <%
        String success = request.getParameter("success");
        if (success != null) {
    %>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        CART ADDED SUCCESSFULLY
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <%
        }
    %> <%
    String wrong = request.getParameter("wrong");
    if (wrong != null) {
%>
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        CART IS ALREADY EXIST!!!
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <%
        }
    %>
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
                            <p><%=f.getPrice() + " "%>KZT</p>
                            <a href="/editFood?id=<%=f.getId()%>" class="btn btn-primary"> EDIT
                            </a>
                        </div>
                    </div>
                </div>

                <%
                    }
                } else if (foods != null) {
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
                            <p><%=f.getPrice() + " "%>KZT</p>
                            <a href="/addToCart?id=<%=f.getId()%>" class="btn btn-primary"> ADD TO CART
                            </a>
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
