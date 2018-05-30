public class Zoo{
    public static void main(String[] args){
        //Animal a1 = new Animal("George", 21, "woah"); - no longer works because Animal is now abstract
        Animal b1 =  new Dog("Rudy", 3, "Bark", false, true);//Could be a dog or animal on far left- but currently is a dog at runtime but an animal at compile time
        //Object o1 = new Object();//object is already imported through the lang package

        //System.out.println(a1);
        System.out.println(b1);

    }
}