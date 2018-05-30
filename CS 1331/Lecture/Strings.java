public class Strings{
    public static void main (String[] args){
        //Multiple ways to make a string
        String name = "Georgia Tech";
        String name2 =  new String("Georgia Tech");
        String name3;
        name3 = "Georgia Tech";
        String name4 = name + name2 + name3;
        String name5 = name4 +42;
        System.out.println(name);
        System.out.println(name2);
        System.out.println(name3);
        System.out.println(name4);
        System.out.println(name5);

        name = "Tech";
        String shortname = name.substring(0,3);//0 through 2
        System.out.println(shortname);

        int place = name.indexOf("e");//Gives the first index of e that it finds
        int place2 = name.indexOf('e');
        System.out.println(place+" "+place2);

        name = name.toUpperCase();
        System.out.println(name);

        //CompareTo function
        System.out.println("cat".compareTo("dog"));

        System empty = "";
        System.out.println(empty.length());
        String emptyalso = null;
        System.out.println(emptyalso.length());
    }
}