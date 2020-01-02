#define DRE(sig, state) (state=(state<<1)|(sig&1)&15)==7
//Initilize button and solenoid pins
int button1 = 4;
int button2 = 5;
int button3 = 6;
int button4 = 7;
int button5 = 8;
int button6 = 9;
int solenoidPin = 10;

//Specify the order that buttons need to be clicked in
int order[] = {-1,-1,-1,-1,-1,-1}; //Variable with current button order
int soln[] = {1,2,3,4,5,6};

int buttonStates[6];

//Button state vaiables
int button1state;
int button2state;
int button3state;
int button4state;
int button5state;
int button6state;


// Set up debouncing variables
unsigned long lastTime = 0;
unsigned long debounceDelay = 50;

void setup() {
  pinMode(button1, INPUT);
  pinMode(button2, INPUT);
  pinMode(button3, INPUT);
  pinMode(button4, INPUT);
  pinMode(button5, INPUT);
  pinMode(button6, INPUT);
  pinMode(solenoidPin, OUTPUT);
  pinMode(13, OUTPUT);
  Serial.begin(9600);

}

void loop() {
  //Read the button states
  button1state = digitalRead(button1);
  if (DRE(digitalRead(button1),buttonStates[0] )){//use DRE????
    moveLeft(1);
    Serial.println("1");
  }
  button2state = digitalRead(button2);
  if (DRE(digitalRead(button2),buttonStates[1])){
    moveLeft(2);
    Serial.println("2");
    }
  button3state = digitalRead(button3);
  if (DRE(digitalRead(button3),buttonStates[2])){
    moveLeft(3);
    Serial.println("3");
    }
  button4state = digitalRead(button4);
  if (DRE(digitalRead(button4),buttonStates[3])){
    moveLeft(4);
    Serial.println("4");
    }
  button5state = digitalRead(button5);
  if (DRE(digitalRead(button5),buttonStates[4])){
    moveLeft(5);
    Serial.println("5");
    }
  button6state = digitalRead(button6);
  if (DRE(digitalRead(button6),buttonStates[5])){
    moveLeft(6);
    Serial.println("6");
    }
  
  if(order[0] ==  soln[0] && order[1] ==  soln[1] && order[2] ==  soln[2] && order[3] ==  soln[3] && order[4] ==  soln[4] && order[5] ==  soln[5]){  // if all buttons have been clicked in right order
    //Trigger solenoid
    digitalWrite(solenoidPin, HIGH);//Trigger Solenoid
    digitalWrite(13, HIGH);
    Serial.println("Yay");
    delay (5000);
    digitalWrite(solenoidPin, LOW);//Lights up LED on board
    digitalWrite(13, LOW);
    order[0] = -1;  
    order[1] = -1;  
    order[2] = -1;  
    order[3] = -1;  
    order[4] = -1;  
    order[5] = -1;   
  }
  delay(10);
}

void moveLeft(int num){
  order[0] = order [1];  
  order[1] = order [2];  
  order[2] = order [3];  
  order[3] = order [4];  
  order[4] = order [5];  
  order[5] = num;   
  Serial.print(order[0]);
  Serial.print(order[1]);
  Serial.print(order[2]);
  Serial.print(order[3]);
  Serial.print(order[4]);
  Serial.println(order[5]);
}
