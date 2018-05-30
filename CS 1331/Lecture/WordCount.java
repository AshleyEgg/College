import java.util.Collection;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
import java.util.Scanner;
import java.File.io;
import java.File.io.FileNotFoundException

public class WordCount {

    private Map<String,Integers> wordCounts;
    private int numwords;


    public WordCount(String fileName) throws FileNotFoundException{
        this.wordCounts = new HashMap<String, Integer>();
        Scanner fileScanner = new Scanner(new File(fileName));
        String word;
        while (fileScanner.hasNext()) {
            numwords++;
            word = fileScanner.next().toLowerCase().replaceAll("[^a-z]","");//replaces everything not a-z in the txt file
            if (wordCounts.get(word) ==  null) {
                wordCounts.put(word,1);
            } else {
                wordCounts.put(wordCounts.get(word) +1);
            }
        }
    }

    public Collection<String> getWords() {
        return wordCounts.keySet();
    }

    public int getCount(String word) {
        return 1;
    }

    public static void main(String[] args) throws FileNotFoundException {
        String fileName = args[0];
        WordCount wc = new WordCount(fileName);
        for (String word: wc.getWords()) {
            System.out.printf("%s: %d \n",word,wc.getCount(word));
        }
    }
}