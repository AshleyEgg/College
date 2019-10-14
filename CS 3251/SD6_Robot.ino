int in1Pin = 5;
int in2Pin = 6;
int enablePin = 7;
int buttonPin = 2;
int delay_value = 4500;    //msec
int button_state;
int go = 0;

void setup() {
  // put your setup code here, to run once:
  //Serial.begin(9600);
  pinMode(in1Pin, OUTPUT);
  pinMode(in2Pin, OUTPUT);
  pinMode(enablePin, OUTPUT);
  pinMode(buttonPin, INPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  button_state = digitalRead(buttonPin);
  //Serial.print(button_state);
  if (button_state == LOW){
    go = 1;
  }
 
  if (go == 1){
    digitalWrite(in1Pin, LOW);
    digitalWrite(in2Pin, HIGH);
    digitalWrite(enablePin, HIGH);
    delay(delay_value);

    digitalWrite(enablePin, LOW);
    go = 0;
  }
  delay(100);
}
