import javax.swing.JFrame;
import javax.swing.JPanel;

@SuppressWarnings("serial")
public class Main extends JPanel{
     public static void main(String[] args)
     {
         JFrame jf = new JFrame("Matrix raining code - by Ran Galili");
         jf.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
         jf.setSize(700,700);
         jf.setResizable(false);
         jf.add(new Drawing());
         jf.setVisible(true);
      }
}