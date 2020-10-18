package items;

public class UserItem {
    private final String name;
    private final String password;
    private String fname;
    private String sname;


    public UserItem(String name, String password) {
        this.name = name;
        this.password = password;
    }

    public UserItem(String name, String password, String fname, String sname) {
        this.name = name;
        this.password = password;
        this.fname = fname;
        this.sname = sname;
    }

    public String getName() {
        return name;
    }

    public String getPassword() {
        return password;
    }

    public String getFname() {
        return fname;
    }

    public String getSname() {
        return sname;
    }
}
