public class Recitation829{//public- allows anyone to see the class vs private-restricts the access to the class -- Make sure the file name matches the name of the class
    public static void main(String[] args){//Main method--static-you dont need to create an instance to access the method--void-return type meaning nothing is happening-- String[] args-is an empty array of strings
        System.out.print("Hello World");//Does not jump to a new line
        System.out.println("Hello people!");//Jumps to a new line after running the code
        String myName = "Ashley";
        System.out.printf("hello %s", myName);//Prints the variable in myName and goes and finds it like MATLAB- can be used to specify number of decimal points of number of spaces in front of or behind a string
        int myInt = 5;
        System.out.println(myInt);
        double myDouble = myInt;
        System.out.println(myDouble);
        // float myFloat = myInt;
        // System.out.println(myFlaot);
        float myFloat = (float) myDouble;//You need to cast the variable in order to make it work
        System.out.println(myFloat);

        if (myInt==3)
            System.out.println("true");
        else if (myInt==5)
            System.out.println("maybe");
        else
            System.out.println("false");
    }
}
