package controller;

import db.sql.BookSql;
import db.sql.GenreSql;
import interface_pac.ControllerInterface;
import items.BookItem;
import items.GenreItem;

import java.util.LinkedList;

public class BookController implements ControllerInterface<BookItem> {
    private final BookSql bookSql = new BookSql();
    private final GenreSql genreSql = new GenreSql();

    public BookController() {

    }

    //getter

    //interface method
    @Override
    public LinkedList<BookItem> getAll() {
        return bookSql.getAll();
    }

    @Override
    public BookItem getItemById(Integer id) {
        return bookSql.searchById(id);
    }

    //method
    public LinkedList<BookItem> getBooksByGenreId(Integer id) {
        return bookSql.getBooksByGenre(id);
    }

    public LinkedList<GenreItem> getBookGenreById(Integer id) {
        return genreSql.getBookGenreById(id);
    }

    public LinkedList<BookItem> recommendBookList() {
        return bookSql.recommendBookList();
    }
}
