package controller;

import db.sql.UserSql;
import interface_pac.ControllerInterface;
import items.UserItem;

import java.util.LinkedList;

public class UserController implements ControllerInterface<UserItem> {
    private final UserSql userSql = new UserSql();

    @Override
    public LinkedList<UserItem> getAll() {
        return null;
    }

    @Override
    public UserItem getItemById(Integer id) {
        return null;
    }

    public UserItem findUserByUsername(String username) {
        return userSql.searchUserByUsername(username);
    }

    public void addNewUser(UserItem user) {
        userSql.addUser(user);
    }
}
