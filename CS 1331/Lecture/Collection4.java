import java.util.*;
public class Collection4 {
    public static void main(String[] args) {
        BirthdayPartyList list = new BirthdayPartyList();
        list.add("Name1");
        list.add("Name2");
        list.add("Name3");
        Iterator helpMe = list.iterator();
        System.out.println(helpMe.next());
        for (String singleStr : list){
            System.out.println(singleStr);
        }
    }
}
class BirthdayPartyList implements Iterable<String> {
    private int size;
    private String[] backingArr = new String[5];

    private class BdayIterator implements Iterator<String>{
        private int ind;
        public boolean hasNext(){
            return ind < size;
        }
        public String next(){
            if (hasNext()){
                return backingArr[ind++];

            } else {
                throw new NoSuchElementException("no more things!");
            }
        }
    }
}
