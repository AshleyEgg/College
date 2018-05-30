public class Box<E> {//You can put multiple letters and have multiple letters in the code
    E data;

    public Box(E data) {
        this.data = data;
    }

    public E getData() {
        return data;
    }
}