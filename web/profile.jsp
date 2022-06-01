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

            <h3>HELLO <%
                if (online){
                    out.print(currentUser.getName() + currentUser.getSurname());
                }
            %></h3>

        </div>
    </div>
</div>

</body>
</html>
