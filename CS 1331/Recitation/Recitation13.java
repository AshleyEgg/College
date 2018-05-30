import java.util.Stack;
import java.util.Queue;
import java.util.ArrayList;

public class Recitation13 {

    public static void main(String[] args) {

        //////////////////////
        //    Recursion     //
        //////////////////////

        System.out.println();

        System.out.println("Iterative:");
        System.out.println();

        System.out.printf("Iterative factorial of 5 is: %d", factorialIter(5));
        System.out.println();
        System.out.println();

        System.out.println("Recursive:");

        System.out.println();
        System.out.printf("Recursive factorial of 5 is: %d", factorial(5));
        System.out.println();
        System.out.println();

        //////////////////////
        //   Linked List    //
        //////////////////////

        ArrayList<String> classroomAL = new ArrayList<>();
        classroomAL.add("Student1");
        classroomAL.add("Student2");


        System.out.println("ArrayList:");
        for (String student : classroomAL) {
            System.out.println(student);

        }
        System.out.println();

        System.out.println("Linked List:");

        LinkedList<String> classroom = new LinkedList<>();
        classroom.addAtFront("Student1");
        classroom.addAtFront("Student2");
        // classroom.insert("Student3", 2);
        // classroom.insert("Student4", 3);

        classroom.iterate();
        System.out.printf("Size of this class (LL) is: %d\n", classroom.size());

        // Successful vs. Unsuccessful get(). What happens if get fails().
        System.out.printf("Look for a node with this data: %s. I found this: %s", "Student1", classroom.get("Student1").data);

        System.out.println();
    }

    //////////////////////
    //     Iterative    //
    //////////////////////

    public static int factorialIter(int n) {
        int num = 1;
        int i;
        if (n == 0) {
            num = 1;
        } else {
            for (i = 1; i <= n; i++) {
                num = num * i;
                // System.out.printf("My value is now: %d\n", num);
            }
        }
     return num;

    }

    //////////////////////
    //     Recursive    //
    //////////////////////

    public static int factorial(int n){
        // Base case
        if (n <= 1) {
            // System.out.printf("factorial(1) = 1              Got to base case, now I can give this back to my previous calls. \n");
            return 1;
        // Recursive step
        } else {
            // System.out.println(factString(5, n-1));
            return n * (factorial(n-1));
        }
    }

    //////////////////////
    //   Linked List    //
    //////////////////////


    // Linked lists are made of Nodes, which contain data and a reference to the next node in the list.
    private static class Node<E> {
        E data;
        Node next;

        public Node(E data) {
            this.data = data;
        }
    }

    // Linked list contains only a reference to the head node #itknowsnothing
    private static class LinkedList<E> {
        Node head = null;

        public void addAtFront(E data) {
            // 1. Create node
            Node myNode = new Node(data);
            // 2. Set the next reference of the new Node to the current head
            myNode.next = this.head;
            // 3. Set the head reference of the Linked List to the new node
            this.head = myNode;
        }

        // In arrayList, you could go through every index. Here, since you cannot index, you must call next until you hit a null.
        public void iterate() {
            // 1. Start at head
            Node cur = head;
            // 2. Check if the node is null. If it is, then you have reached the end of your Linked list.
            while (cur != null) {
                System.out.println(cur.data);
                cur = cur.next;
            }
        }

        public void insert(E data, int index) {
            // 1. Create node
            Node myNode = new Node(data);
            // 2. Iterate to find the node previous to the new node.
            Node prev = head;
            for (int i = 0; i < index - 1; i++) {
                prev = prev.next;
            }
            // 3. Set the next reference of the new Node to the node that comes after.
            // Note: when you add to data structures, always add the new node first.
            //       If you try to redirect the next reference of the previous node first, you might lose your linked list.
            myNode.next = prev.next;
            // 4. Finally, set the prev's next to the current node. Now, you do not risk losing your list.
            prev.next = myNode;
        }


        // Iterate until you find the data item or  you hit a null.
        public Node get(E data) {
            // 1. Start at head and keep track of whether you find the item.
            Node<E> cur = head;
            boolean foundNode = false;
            // 2. Check if the node is null. If it is, then you have reached the end of your Linked list.
            while (cur != null && !foundNode) {
                if (cur.data.equals(data)) {
                    return cur;
                }
                cur = cur.next;
            }
            // 3. If you didn't find it, return null.
            return null;
        }

        // Basically iterate but with a counter
        public int size() {
            // 1. Start at head
            Node<E> cur = head;
            int size = 0;
            // 2. Check if the node is null. If it is, then you have reached the end of your Linked list.
            while (cur != null) {
                size++;
                cur = cur.next;
            }
            return size;
        }
    }

    //////////////////////
    //     Stack        // first in last out
    //////////////////////


    private static class Stack<E> {

        // Backing arrayList
        private ArrayList<E> elems = new ArrayList<>();

        // Add at the end.
        public void push(E item) {
            elems.add(item);
        }
        // Remove from the end.
        public E pop() {
            return elems.remove(elems.size() - 1);
        }
        public boolean isEmpty() {
            return elems.isEmpty();
        }
    }


    private static class LinkedStack<E> {

        // LinkedStack's own node class
        private class Node<E> {
            E data;
            Node<E> next;

            Node(E data, Node<E> next) {
                this.data=data;
                this.next=next;
            }
        }

        private Node<E> head;

        // Create new node and make it the of the list head. See that we make our node's next the current head.- adds to the top of the stack
        public void push(E item) {
            head = new Node<E>(item, head);
        }

        // Grab the data from the node we want to remove, then set the head to the node's next.- always removes from the top of the stack
        public E pop() {
            E answer = head.data;
            head = head.next;
            return answer;
        }

        public boolean isEmpty() {
            return (head == null);
        }
    }

    //////////////////////
    //     Queue        //first in first out
    //////////////////////


    public static class Queue<E> {
        private ArrayList<E> elems = new ArrayList<>();

        // Add at the end
        public void enqueue(E item) {
            elems.add(item);
        }
        // Remove from the front
        public E dequeue() {
            return elems.remove(0);
        }

        // Just check if the backing list is empty.
        public boolean isEmpty() {
            return elems.isEmpty();
        }
    }


    public class LinkedQueue<E> {
        // LinkedQueue's own node class
        private class Node<E> {
            E data;
            Node<E> next;

            Node(E data, Node<E> next) {
                this.data=data;
                this.next=next;
            }
        }
        // Keep a reference to the last node so we can add easily.
        private Node<E> head;
        private Node<E> last;

        public void enqueue(E item) {
            Node<E> newNode = new Node<E>(item, null);
            if (null == head) {
                head = newNode;
            }
            if (null != last) {
                last.next = newNode;
            }
            last = newNode;
        }
        // We remove from the front of the linked list.
        public E dequeue() {
            E answer = head.data;
            head = head.next;
            return answer;
        }

        public boolean isEmpty() {
            return (head == null);
        }
    }

    public static String factString (int original, int call) {
        String factString = "";
        for (int i = original; i > call; i--) {
            factString += i + " * ";
        }
        factString += "factorial(" + call+ ")";
        return factString;

    }



}