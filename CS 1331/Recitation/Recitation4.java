public class Recitation4{
    public static final double CONSTANT_PI = 3.1415;

    public static void main(Sting[] args){
        Month firstMonth = Month.January;
        Month secondMonth = Month.January;
        System.out.println(firstMonth == secondMonth);//returns true
        System.out.println(firstMonth.ordinal() < secondMonth.ordinal());//returns false because they are both equal to 0
    }
}