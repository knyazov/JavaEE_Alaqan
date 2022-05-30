<%@ page import="Entities.User" %>
<%
    User currentUser = (User) request.getSession().getAttribute("currentUser");

    boolean online = false;
    if (currentUser != null) {
        online = true;
    }
%>