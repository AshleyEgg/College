public class RecursivePractice {

    //Recursion has 3 rules
    //  must have a base case
    //  must include a call to itself
    //  must approach the base case

    public static void main(String[] args) {
        recCountDown(10);
    }

    public static void recCountDown(int n) {
        if (n == 0) {
            System.out.println(0);
        } else {
            //System.out.println(n);//counts up
            recCountDown(n-1);
            System.out.println(n);//counts down
        }
    }

    public static int sumUp(int n) {
        if (n == 1) {
            return 1;
        } else {
            return n + sumUp(n -1);
        }
    }
}