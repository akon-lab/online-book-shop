package controller;

import db.sql.GenreSql;
import items.GenreItem;

import java.util.LinkedList;

public class GenreController {
    private final GenreSql genreSql = new GenreSql();

    public GenreController() {

    }

    public GenreItem getGenreById(Integer id) {
        return genreSql.searchById(id);
    }

    public LinkedList<GenreItem> allGenre() {
        return genreSql.getAll();
    }
}
