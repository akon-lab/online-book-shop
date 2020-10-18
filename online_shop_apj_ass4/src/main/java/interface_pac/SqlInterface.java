package interface_pac;

import java.util.LinkedList;

public interface SqlInterface<T> {
    T searchById(Integer id);

    LinkedList<T> getAll();

}
