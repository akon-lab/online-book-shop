package db.sql;

import db.ConnectDb;
import interface_pac.SqlInterface;
import items.BookItem;
import items.UserItem;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

public class UserSql extends ConnectDb implements SqlInterface<UserItem> {

    @Override
    public UserItem searchById(Integer id) {
        return null;
    }

    @Override
    public LinkedList<UserItem> getAll() {
        return null;
    }

    public UserItem searchUserByUsername(String username) {
        UserItem userItem = null;

        try {
            String sql = "select * from users " +
                    "where username = " + username + ";";
            Statement statement = super.getConnection().createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            if (resultSet.next()) {
                userItem = new UserItem(
                        resultSet.getString("name"),
                        resultSet.getString("password"),
                        resultSet.getString("fname"),
                        resultSet.getString("sname")
                );
            }

        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }

        return userItem;
    }

    public void addUser(UserItem user) {
        try {
            String sql = "INSERT INTO users(username,password,fname,sname) " +
                    "VALUES(?, ?, ?, ?)";
            PreparedStatement stmt = super.getConnection().prepareStatement(sql);

            stmt.setString(1,user.getName());
            stmt.setString(2, user.getPassword());
            stmt.setString(3, user.getFname());
            stmt.setString(4,user.getSname());

            stmt.execute();
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
    }

}
