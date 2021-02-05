#include <PWM.h>

unsigned long lastTime;           //system
double ITerm, lastInput, v;          //system, system

double Input, Output, Setpoint;   //TempSensorAI, PWMAO, TempDesiredUI
int SampleTime = 100;             //100 milliseconds
double kp = 10;                        //Proportional Constant
double ki = 0.80;                        //Integrator Constant
double kd = 0.75;                        //Differentiator Constant


void setup() {
    Serial.begin(9600);

    pinMode(A0, INPUT);   //Temp Reading
    pinMode(12, INPUT);  //Check if reading should continue
    pinMode(3, OUTPUT);
    pinMode(A1, INPUT);
    pinMode(5, OUTPUT);

    Setpoint = 26;
}


void loop() {
   
    v = analogRead(A0);
    float mv = ( v/1024.0)*5000; 
    float Input = mv/10;
    //Serial.println(Input);

    if(Serial.available()>0) // if there is data to read
    {
    Setpoint=Serial.read(); // read data
    }

    unsigned long now = millis();
    int timeChange = (now - lastTime);
    if(timeChange>=SampleTime)
    {
        /*Compute all the working error variables*/
        double error = Input - Setpoint;
        ITerm+= (ki * error);
        if(ITerm> 255) ITerm= 255;
        else if(ITerm< 51) ITerm= 51;
        double dInput = (lastInput - Input);

        /*Compute PID Output*/
        Output = kp * error + ITerm- kd * dInput;
        if(Output> 255) Output = 255;
        else if(Output < 51) Output = 51;
        Serial.println(Output);

        /*Remember some variables for next time*/
        lastInput = Input;
        lastTime = now;

        pwmWrite(3, Output);
        analogWrite(5, Output);

    }
}
