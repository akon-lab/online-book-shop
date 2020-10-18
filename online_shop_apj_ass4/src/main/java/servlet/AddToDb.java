package servlet;

import db.sql.BookSql;
import items.BookItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@MultipartConfig
public class AddToDb extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String title = req.getParameter("title");
        String desc = req.getParameter("desc");
        String price = req.getParameter("price");
        String image = req.getParameter("img");
        String author = req.getParameter("author");
/*

        boolean isMultipartContent = ServletFileUpload.isMultipartContent(req);
        if (!isMultipartContent) {
            return;
        }

        System.out.println(title + " " + desc + " " + price + " " + image);

        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        FileItem fileItem = null;
        try {
            List<FileItem> fields = upload.parseRequest(req);
            Iterator<FileItem> it = fields.iterator();
            if (!it.hasNext()) {
                return;
            }
            while (it.hasNext()) {
                fileItem = it.next();
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
*/
        BookSql bookSql=new BookSql();
        bookSql.addBook(new BookItem(title, desc, Integer.parseInt(price),image,author));
    }
}
