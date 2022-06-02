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
import java.util.ArrayList;

@WebServlet(value = "/home")
public class HomeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User currentUser = (User) request.getSession().getAttribute("currentUser");
        if (currentUser != null) {
            request.setAttribute("currentUsder", currentUser);
        }
        ArrayList<Foods> foods = DBManager.getAllFoods();
        request.setAttribute("foods", foods);
        request.getRequestDispatcher("/home.jsp").forward(request, response);
    }


}
