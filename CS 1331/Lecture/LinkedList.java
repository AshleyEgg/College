public class LinkedList {

    private class Node {
        Object data;
        Node next;

        public Node(Object data, Node next) {
            this.data = data;
            this.next = next;
        }
    }

    private Node head; //points to the first node
    //private Node tail;

    /**
     * Add a new item to the head of this list.
     */
    public void add(Object item) {
        head = new Node(item, head);
    }

    /**
     * Return the item at the head of this list and remove it from this list.
     */
    public Object removeHead() {
        if (null == head) {
            throw new RuntimeException("Can't removeHead() on empty list.");
        }
         //to be done
    }

    /**
     * The number of items in this list.
     */
    public int length() {
        int len = 0;
        Node node = head;
        while (node != null) {
            len++;
            node = node.next;
        }
        return len;
    }


    /**
     * @return true if this list has no elements, false otherwise.
     */
    public boolean isEmpty() {
        return head == null;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder("[");
        for (Node node = head; node != null; node = node.next) {
            sb.append(node.data + " ");
        }
        return sb.toString() + "]";
    }


    // See slide 8
    public void insertAfter(Object existingItem, Object newItem) {
        Node curNode = head;
        while (!curNode.data.equals(existingItem) &&
               (curNode.next != null)) {
            curNode = curNode.next;
        }
        Node newNode = new Node(newItem, curNode.next);
        curNode.next = newNode;
    }

    public Object remove() {
           //to be done
    }



    public static void main(String[] args) {
        LinkedList list = new LinkedList();

        System.out.println(list);
        System.out.println("list.length(): " + list.length());

        list.add("Cat");
        list.add("Dog");
        list.add("Bird");
        list.add("Rabbit");
        list.add("Snake");

        System.out.println(list);
        System.out.println("list.length(): " + list.length());

        Object item = list.remove();
        System.out.println(item);

        System.out.println(list);
        System.out.println("list.length(): " + list.length());


    }
}
