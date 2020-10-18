package servlet;

import controller.BookController;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "BookServlet")
public class BookServlet extends HttpServlet {
    private final BookController bookController = new BookController();


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));

        request.setAttribute("bookRecomendList", bookController.recommendBookList());
        request.setAttribute("bookGenre", bookController.getBookGenreById(id));
        request.setAttribute("bookItem", bookController.getItemById(id));

        getServletContext().getRequestDispatcher("/product.jsp").forward(request, response);
    }
}
