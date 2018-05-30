public class Doberman {

   public static final String STD_DOBIE_SIZE = "Large";
   private static int dobieCount = 0;
   private String name;// this refers to this field



   public Doberman() {
      this.name = "Doby";
      dobieCount++;
   }

   public Doberman(String n) {
      this.name = n;
      dobieCount++;
   }

   public String toString() {
      return "A doberman named " + this.name + ".";
   }

   public String getName() {
      return this.name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public static int getDobieCount() {
      return dobieCount;
   }


}
