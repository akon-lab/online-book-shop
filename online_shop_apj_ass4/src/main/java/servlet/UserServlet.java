package servlet;

import controller.UserController;
import items.UserItem;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

public class UserServlet extends HttpServlet {
    private final UserController controller = new UserController();
    Set<String> message = new HashSet<>();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String fname = req.getParameter("fname");
        String sname = req.getParameter("sname");

        controller.addNewUser(new UserItem(username,password,fname,sname));

        req.setAttribute("message", message.add("Welcome back " + username + "!"));
        getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        if (controller.findUserByUsername(username) != null) {
            UserItem user = controller.findUserByUsername(username);
            if (user.getPassword().equals(password)) {
                req.setAttribute("message", message.add("Welcome back " + username + "!"));
            } else {
                req.setAttribute("message", message.add("Your password not correct"));
            }
        } else {
            req.setAttribute("message", message.add("Such user not exist"));
        }

        getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);

    }
}
