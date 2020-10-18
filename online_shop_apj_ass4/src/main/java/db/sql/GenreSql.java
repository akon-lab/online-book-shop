package db.sql;

import db.ConnectDb;
import interface_pac.SqlInterface;
import items.GenreItem;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

public class GenreSql extends ConnectDb implements SqlInterface<GenreItem> {

    @Override
    public GenreItem searchById(Integer id) {
        GenreItem item = null;

        try {
            String sql = "select * from genre " +
                    "where id = " + id + ";";
            Statement statement = super.getConnection().createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            if (resultSet.next()) {
                item = new GenreItem(resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getString("image"));
            }

        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }

        return item;
    }

    @Override
    public LinkedList<GenreItem> getAll() {
        LinkedList<GenreItem> genreItems = new LinkedList<>();
        try {
            String sql = "select * from genre ";
            Statement statement = super.getConnection().createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                genreItems.add(new GenreItem(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getString("image")
                ));
            }

        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
        return genreItems;
    }

    public LinkedList<GenreItem> getBookGenreById(Integer id) {
        LinkedList<GenreItem> list = new LinkedList<>();
        try {
            String sql = "select * from genre" +
                    "where id in (select g_id from books_genre" +
                    "             where b_id = " + id + ")";

            Statement statement = super.getConnection().createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                list.add(new GenreItem(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getString("image")
                ));
            }

        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
        return list;
    }
}
