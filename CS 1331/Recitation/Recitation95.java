import java.util.Scanner;
import java.io.File;// Used for file io
import java.io.PrintStream;


public class Recitation95{
    public static void main(String[] args){
        //Switch Statements
        String color = "red";
        switch (color){
        case "red":
             System.out.println("It's red!");
             break;
         case "blue":
             System.out.println("It's blue!");
             break;
         default:
             System.out.println("Not red or blue");
        }
        System.out.println("All done");


        //While loops
        int counter = 0;
        while (counter<5){
            System.out.println("Running");
            counter++;
        }
        System.out.println("Done");



        //do-while loop
        int doCounter = 1;
        do{
            System.out.println("Running do while");

        }while (doCounter<1);


        //For loop
        for(int i=0; i < 3; i++){
            System.out.println("Loop running! Iteration #: "+i);

        }
        //for(;;) This will run


        //Scanners
        Scanner myScan = new Scanner(System.in);
        int myAge =myScan.nextInt();
        System.out.println("My age is "+ myAge);
        myScan.nextLine();
        /*nextInt() -gets next int
        next()-gets the next word/token
        nextLine() - goes until newline char
        */
        System.out.println("Please enter your name:");
        String name =  myScan.nextLine();
        System.out.println("MyName is: "+ name);


        //Text Scanner-used for low level file io?
        /*Scanner textScanner = new Scanner(new File("input.txt"));
        System.out.println(textScanner.hasNextLine());
        while (textScanner.hasNextLine()){
            System.out.println(textScanner.nextLine());
        }

        */


        // Used to output a low level file
        // PrintSteram myStream = new PrintStream(new File("output.txt"));
        // myStream.println("yay!");
        // myStream.println("Something is here.");

        //Arrays
        int[] myArrayofInts =  new int[10];//initilizes a 1x10 int array
        myArrayofInts[8] = 12;//Assigns the value 12 to the 8th position
        System.out.println(myArrayofInts[8]);
        //array.length - gives the length of the array



        //For-each loop
        for(int anInt : myArrayofInts){//For every element of this array do something
            System.out.println(anInt);
        }

        //2D array
        int [][] grid = new int [10][10];//row then col
        System.out.println(grid[2][3]);
        //Use nested loops to go through it


    }
}
