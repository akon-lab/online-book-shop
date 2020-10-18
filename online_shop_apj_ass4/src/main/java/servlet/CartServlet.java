package servlet;

import controller.BookController;
import items.BookItem;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class CartServlet extends HttpServlet {
    private final BookController bookController = new BookController();
    private Map<Integer, BookItem> cart = null;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer b_id = Integer.parseInt(req.getParameter("id"));
        String action = req.getParameter("action");

        if (action == null) {
            action = "";
        }
        if (action.equals("add")) {
            addToCart(req, resp, b_id);
        }


        getServletContext().getRequestDispatcher("/cart.jsp").forward(req, resp);
    }

    protected void addToCart(HttpServletRequest req, HttpServletResponse resp, Integer id) throws ServletException, IOException {
        HttpSession session = req.getSession();

        if (cart == null) {
            cart = new HashMap<>();
        }
        cart.put(id, bookController.getItemById(id));

        session.setAttribute("cart", cart);

    }
}
