import java.util.*;
import java.io.*;

public class Exception3 {
    public static void looping() throws NullPointerException,
    ArithmeticException {
        int[] arr = {1,2,3,4,5};
        for (int i = 0; i < 5; i++){
            System.out.println(arr[i]);
        }
    }

    public static void main(String[] args) throws IOException {
        looping();
        System.out.println("Done");
    }
}