package items;


public class GenreItem {
    Integer id;
    String name;
    String image;

    public GenreItem() {
    }

    public GenreItem(Integer id, String name, String image) {
        this.id = id;
        this.name = name;
        this.image = image;
    }

    public Integer getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getImage() {
        return image;
    }
}
