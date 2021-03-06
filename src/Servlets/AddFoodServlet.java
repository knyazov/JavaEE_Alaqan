package Servlets;

import DBManager.DBManager;
import Entities.Foods;
import Entities.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/addFood")
public class AddFoodServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User currentUser = (User) request.getSession().getAttribute("currentUser");
        if (currentUser != null) {
            String name = request.getParameter("name");
            String photo = request.getParameter("photo");
            String description = request.getParameter("description");
            Long price = Long.parseLong(request.getParameter("price"));

            Foods food = new Foods();
            food.setName(name);
            food.setPhoto(photo);
            food.setDescription(description);
            food.setPrice(price);
            food.setUser(currentUser);

            DBManager.addFood(food);
            response.sendRedirect("/addFood");

        } else {
            response.sendRedirect("/login.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User currentUser = (User) request.getSession().getAttribute("currentUser");
        if (currentUser != null) {
            request.setAttribute("currentUser", currentUser);
            request.getRequestDispatcher("addFood.jsp").forward(request, response);

        } else {
            response.sendRedirect("/login");
        }
    }


}
