public class Dog extends Animal implements Adoptable{//extends defines parent class -  implements is for interfaces
    private boolean gotNewspaper;
    private boolean isGoodBoy;
    //private String name;//bad form and hides the name so that it is ony used locally


    public Dog(String name, int age, String sound, boolean gotNewspaper, boolean isGoodBoy){
        super(name, age, sound);//Calls the parent class so that a when dog is constructed it is also an animal
        //java will create a super constructor with no arguments because there needs to be an animal constructor with no arguments
        this.gotNewspaper = gotNewspaper;
        this.isGoodBoy = isGoodBoy;

    }

    @Override//Tells the compiler to check if you can over ride something from parent class
    public String toString() { // Over rides the Animal toString method
        return super.toString() + " Who is a good boy? " + isGoodBoy;//adds on to super toString
    }

    public boolean getIsGoodBoy() {//subclass can have unique methods
        return isGoodBoy;
    }

    public String makeNoise(){
        return getSound() + getSound();
    }

    // public static int getAge() {//bad form and not technically overriding -bound to this class and can be used without creating instance
    //     return 0;
    // }
}