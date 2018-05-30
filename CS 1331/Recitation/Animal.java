public abstract class Animal { // You can not create an animal because it is now abstract
    private String name;//private variables are not inherited
    private int age;
    private String sound;

    public Animal(String name, int age, String sound){
        this.name = name;
        this.age = age;
        this.sound = sound;
    }

    public Animal(){


    }

    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }

    public String getSound() {
        return sound;
    }

    public String toString() {
        return name + " is " + age + " years old make the sound: " +sound;
    }


    public abstract String makeNoise();//Abstract method-every animal will inherit the method but subclass has to have this method
}