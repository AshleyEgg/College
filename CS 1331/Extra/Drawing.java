import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.util.Random;
import javax.swing.JPanel;

@SuppressWarnings("serial")
public class Drawing extends JPanel{

    int FONTSIZE = 32, SCREENSIZE = 700;
    thread1[] thArr = new thread1[SCREENSIZE/FONTSIZE];
    Drawing(){
        for (int i = 0; i < thArr.length; i++) {
            thArr[i] = new thread1(i*FONTSIZE);
        }
    }

    public void paint(Graphics g)
    {
        super.paint(g);
        Graphics2D g2 = (Graphics2D)g;
        g.fillRect(0, 0, SCREENSIZE, SCREENSIZE);
        g.setColor(Color.BLACK);
        Font font = new Font("Monospaced", Font.BOLD, FONTSIZE);
        g2.setFont(font);
        for (int i = 0; i < thArr.length; i++) {
            if(thArr[i].y > 700){
                thArr[i] = new thread1(i*FONTSIZE);
            }
            drawThread(g2,thArr[i]);
        }

        try{Thread.sleep(30);}catch(Exception ex){}

        repaint();
    }
    public void drawThread(Graphics2D g2, thread1 th){
        int fontsize = g2.getFont().getSize();
        for (int i = 0; i < th.len; i++) {
            if(th.randInt(0, th.len) == i)
                th.chArr[i][0] = th.randChar();
            if(i == th.len-1)
                g2.setColor(Color.WHITE);
            else
                g2.setColor(Color.GREEN);
            g2.drawChars(th.chArr[i] ,0 ,1 ,th.x , th.y + (i*fontsize));
        }
        th.y+=th.vel;
    }

    public class thread1{
        int vel, len, x, y, yBottom;
        char[][] chArr;

        thread1(int x){

            this.x = x;
            len = randInt(5,30);
            chArr = new char[len][1];
            chArr = populateArrWithChars(chArr);
            vel = randInt(1,5);
            this.y = (-1)*len*FONTSIZE;
        }
        public char[][] populateArrWithChars(char[][] arr){
            for (int i = 0; i < arr.length; i++) {
                arr[i][0] = randChar();
            }
            return arr;
        }
        public char randChar(){
            final String alphabet = "0123456789QWERTYUIOPASDFGHJKLZXCVBNM";
            final int N = alphabet.length();
            Random r = new Random();
            return alphabet.charAt(r.nextInt(N));
        }
        public int randInt(int min, int max) {
            Random rand = new Random();
            int randomNum = rand.nextInt((max - min) + 1) + min;
            return randomNum;
        }
    }
}