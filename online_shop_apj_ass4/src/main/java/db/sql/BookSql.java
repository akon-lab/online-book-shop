package db.sql;

import db.ConnectDb;
import interface_pac.SqlInterface;
import items.BookItem;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

public class BookSql extends ConnectDb implements SqlInterface<BookItem> {

    public void addBook(BookItem book) {
        try {
            String sql = "INSERT INTO books(title,description,image,price,author) " +
                    "VALUES(?, ?, ?, ?, ?)";
            PreparedStatement stmt = super.getConnection().prepareStatement(sql);
            stmt.setString(1, book.getTitle());
            stmt.setString(2, book.getDesc());
            stmt.setString(3, book.getImg());
            stmt.setInt(4, book.getPrice());
            stmt.setString(5, book.getAuthor());
            stmt.execute();
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
    }

    @Override
    public BookItem searchById(Integer id) {

        BookItem item = new BookItem();

        try {
            String sql = "select * from books " +
                    "where id = " + id + ";";
            Statement statement = super.getConnection().createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            if (resultSet.next()) {
                item = new BookItem(
                        resultSet.getInt("id"),
                        resultSet.getString("title"),
                        resultSet.getString("description"),
                        resultSet.getInt("price"),
                        resultSet.getString("image"),
                        resultSet.getString("author")
                );
            }

            return item;
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }

        return item;
    }

    @Override
    public LinkedList<BookItem> getAll() {
        LinkedList<BookItem> list = new LinkedList<>();

        try {
            String sql = "select * from books ";
            Statement statement = super.getConnection().createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                list.add(new BookItem(
                        resultSet.getInt("id"),
                        resultSet.getString("title"),
                        resultSet.getString("description"),
                        resultSet.getInt("price"),
                        resultSet.getString("image"),
                        resultSet.getString("author")
                ));
            }

        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
        return list;
    }

    public LinkedList<BookItem> getBooksByGenre(Integer id) {
        LinkedList<BookItem> list = new LinkedList<>();

        try {
            String sql = "select * from books " +
                    "where id in(select b_id from books_genre " +
                    "            where g_id = (select id from genre " +
                    "                          where id = " + id + "))";

            Statement statement = super.getConnection().createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                list.add(new BookItem(
                        resultSet.getInt("id"),
                        resultSet.getString("title"),
                        resultSet.getString("description"),
                        resultSet.getInt("price"),
                        resultSet.getString("image"),
                        resultSet.getString("author")
                ));
            }

        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
        return list;
    }

    public LinkedList<BookItem> recommendBookList() {
        LinkedList<BookItem> list = new LinkedList<>();
        try {
            String sql = "select * from books limit 9";
            Statement statement = super.getConnection().createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                list.add(new BookItem(
                        resultSet.getInt("id"),
                        resultSet.getString("title"),
                        resultSet.getString("description"),
                        resultSet.getInt("price"),
                        resultSet.getString("image"),
                        resultSet.getString("author")
                ));
            }

        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
        return list;

    }
}
