package servlet;

import controller.BookController;
import controller.GenreController;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class GenreServlet extends HttpServlet {
    private final GenreController genreController = new GenreController();
    private final BookController bookController = new BookController();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer id = Integer.parseInt(req.getParameter("id"));

        req.setAttribute("genreObj", genreController.getGenreById(id));
        req.setAttribute("thisGenreBooks", bookController.getBooksByGenreId(id));

        getServletContext().getRequestDispatcher("/option.jsp").forward(req, resp);
    }
}
