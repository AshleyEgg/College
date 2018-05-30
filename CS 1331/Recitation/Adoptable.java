public interface Adoptable { // all abstract methods in an interface

    boolean hasBeenAdopted();

    String previousOwner();

    int timeSinceLastOwner();
}