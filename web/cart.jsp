<%@ page import="java.util.ArrayList" %>
<%@ page import="Entities.Cart" %><%--
  Created by IntelliJ IDEA.
  User: Akzhol
  Date: 11.05.2022
  Time: 18:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <%@include file="vendor/header.jsp"
  %>
</head>
<body>
<%@include file="vendor/navbar.jsp" %>
<div class="container">
  <div class="row mt-5">

    <div class="col-sm-12">
      <table class="table table-striped table-hover">
        <thead>
        <tr>
          <th>ID</th>
          <th>NAME</th>
          <th>PRICE</th>
          <th>QUANTITY</th>
          <th>CANCEL</th>
        </tr>
        </thead>
        <tbody>
        <%
          ArrayList<Cart> cartArrayList = (ArrayList<Cart>) request.getSession().getAttribute("cartList");

          if (cartArrayList != null) {
            for (Cart cart :
                    cartArrayList) {

        %>
        <tr>
          <td>
            <%
              out.println(cart.getId());
            %>
          </td>
          <td>
            <%=
            cart.getName()
            %>
          </td>
          <td>
            <%=
            cart.getPrice()
            %>
          </td>
          <td>
            <%=
            cart.getQuantity()
            %>
          </td>
          <td>
            <a href="/removeCart?id=<%=cart.getId()%>" style="color: aliceblue"
               class="btn btn-info btn-sm"> REMOVE </a>
          </td>
        </tr>
        <%
            }
          }
        %>
        </tbody>
      </table>
    </div>
  </div>
</div>
</body>
</html>
