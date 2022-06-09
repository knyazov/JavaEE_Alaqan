package Servlets;

import DBManager.DBManager;
import Entities.Cart;
import Entities.Foods;
import Entities.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(value = "/addToCart")
public class AddToCartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User currentUser = (User) request.getSession().getAttribute("currentUser");
        if (currentUser == null) {

            try {
                ArrayList<Cart> cartList = new ArrayList<>();

                Long id = Long.parseLong(request.getParameter("id"));
                Cart cart = new Cart();
                cart.setId(id);
                Foods food = DBManager.getFood(id);
                cart.setName(food.getName());
                cart.setPrice(food.getPrice());
                cart.setQuantity(1);


                ArrayList<Cart> cartArrayList = (ArrayList<Cart>) request.getSession().getAttribute("cartList");

                if (cartArrayList == null) {
                    cartList.add(cart);
                    request.getSession().setAttribute("cartList", cartList);
                    response.sendRedirect("/home?success");
                } else {
                    cartList = cartArrayList;
                    boolean exist = false;
                    for (Cart c :
                            cartArrayList) {
                        if (c.getId() == id) {
                            exist = true;
                            response.sendRedirect("/home?wrong");
                        }
                    }
                    if (!exist) {
                        cartList.add(cart);
                        response.sendRedirect("/home?success");
                    }
                }


            } catch (Exception e) {
                e.printStackTrace();
            }

        } else {
            response.sendRedirect("/login");
        }
    }
}
