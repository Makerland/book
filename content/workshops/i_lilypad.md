\newpage
\thispagestyle{empty}
\mbox{}

\newpage

![](content/workshop_images/lilypad.jpg)

\customtitlepage{Build a smart watch with Lilypad}

>During Lilypad tutorial you will have a chance to create multifunctional smart watch. In few steps you will learn how to make interactive soft circuit and how to use basic controllers to create various function. Our fancy, smart bracelet will manage your time and communicate your busyness. Simple circuit upgrade will let you create even light piano instrument or memory game. Come, and develop your own functionalities! 

### Authors

__Karolina Chmiel__  is the lead UX designer in Polidea, where she creates mobile apps. She co-organized the Jitter hackathon and conducted a Lilypad workshop as a part of this event. Since Karolina discovered the possibilities of the Lilypad board, she's been spending her 
spare time cutting, sewing, and experimenting with various materials to create interactive soft-circuits for wearables.

\newpage

# Build a smart watch with Lilypad

## Overview

Create your own multifunctional smart watch with the LilyPad Arduino, a microcontroller board designed for wearables and e-textiles. It can be sewn to fabric and similarly mounted power supplies, sensors and actuators with conductive thread. During this workshop you will learn how to sew and connect whole elements. 

Have you ever heard about pomodoro technique? When whole leds are bright, that means you are very busy and nobody should disturb you. When leds are off, buzzer sound tells you that this is brake time. This management method uses a timer to break down work into intervals and it is based on the idea that frequent breaks can improve mental agility. 

## Preparations

We have two different Lilypad boards available: Arduino LilyPad FTDI and Arduino LilyPad USB. The difference is that Arduino LilyPad USB is simpler: it connects directly with computer by micro-USB cable and have less pins. Arduino LilyPad FTDI  needs to be connected through FTDI Breakout (drivers are needed). Feel free to choose one of them and follow appropriate instruction. __Make sure that you have collected:__

Arduino LilyPad FTDI, FTDI Breakout and mini USB cable

![](content/workshops/lilypad/1.jpg) \

or Arduino LilyPad USB and micro USB cable

![](content/workshops/lilypad/2.jpg) \

\newpage

Battery Holder and Cell batery

![](content/workshops/lilypad/3.jpg) \ ![](content/workshops/lilypad/4.jpg)

Buzzer

![](content/workshops/lilypad/5.jpg) \

3 LEDs and 3 Photoresitors 

![](content/workshops/lilypad/6.jpg) \ ![](content/workshops/lilypad/7.jpg)

Conductive thread, normal thread, needle and prepared material base

![](content/workshops/lilypad/8.jpg) \

2 Press-studs

![](content/workshops/lilypad/9.jpg) \


**Arduino LilyPad FTDI** and **Arduino LilyPad USB**

![](content/workshops/lilypad/10.jpg) \ ![](content/workshops/lilypad/11.jpg)


## Installing and configuring LilyPad Arduino on Windows

Get the latest version of arduino environment from the Arduino website: <http://arduino.cc/en/Main/Software>

Attach the FTDI board to your LilyPad Arduino board. Attach one end of the USB cable to your FTDI board and the other end to a USB port on your computer.

![](content/workshops/lilypad/12.jpg)

### Select your board

You'll need to select the entry in the *Tools > Board* menu: **Lilypad Arduino w/ ATmega328**

### Select your serial port

Select the serial device of the Arduino board from the *Tools > Serial Port* menu. This is likely to be **COM3** or higher (**COM1** and **COM2** are usually reserved for hardware serial ports).

### Upload the program

Open the LED blink example sketch: *File > Examples > 1.Basics > Blink*. 

Now, simply click the *Upload* button in the environment (arrow ->). Wait a few seconds - you should see the leds on the board flashing. If the upload is successful, the message "Done uploading." will appear in the status bar. 

A few seconds after the upload finishes, you should see the pin 13 (L) LED on the board start to blink (in orange). If it does, congratulations! You've gotten LilyPad up-and-running. 


## Installing and configuring LilyPad Arduino on Mac OS X

Get the latest version of LilyPad Arduino environment from the Arduino website: <http://arduino.cc/en/Main/Software>

Attach the FTDI board to your LilyPad Arduino board. Attach one end of the USB cable to your FTDI board and the other end to a USB port on your computer. 

![](content/workshops/lilypad/15.jpg)

### Install the FTDI Drivers

You will need to install the drivers for the FTDI board that enables you to program the LilyPad Arduino. You need to download the latest version of the drivers from the FTDI website: <http://www.ftdichip.com/Drivers/VCP.htm>

Scroll down to the middle of this page, where there is a table listing drivers for different computers. Click on the most recent driver that is compatible with your computer. If your computer is running OS 10.5 or higher you should use the x64 (64-bit) drivers. If you're running OS 10.4 you should use the x32 (32-bit) drivers. Otherwise, you should use the PPC (PowerPC) drivers. To determine which OS your computer has, click on the apple icon in the upper right hand corner of your screen and click on "About This Mac" menu item.

### Select your board

You'll need to select the entry in the *Tools > Board* menu that corresponds to your LilyPad Arduino.

### Select your serial port

Select the correct serial port from the *Tools > Serial Port* menu.

### Upload the program

Open the LED blink example sketch: *File > Examples > 1.Basics > Blink*.

Now, simply click the "Upload" button in the environment (arrow ->). Wait a few seconds - you should see the leds on the board flashing. If the upload is successful, the message "Done uploading." will appear in the status bar. 

## Main flow 

Lets start with stop-watch function. 

First of all we have to prepare our circuit. We will sew a bit, but don’t worry – everything is prepared, there is not much left. This is our basis.
 
*Arduino LilyPad FTDI* and *Arduino LilyPad USB*:

![Arduino LilyPad FTDI](content/workshops/lilypad/18.jpg) \ ![Arduino LilyPad USB](content/workshops/lilypad/19.jpg)

Whole elements and thread paths are printed on. All you have to do is to follow the instructions. Each piece of LilyPad have adhesive tape at the back side to help you place Lilypad elements on the material. 

To make your watch durable, sew elements using normal thread and then use conductive thread to connect pins. When sewing, it is very important that the different threads never overlap one another. 

To make sawing easier, whole thread paths are dotted. Just to help you a bit, LilyPad board and battery holder are already sewed and connected.


*Arduino LilyPad FTDI* and *Arduino LilyPad USB*:

![Arduino LilyPad FTDI](content/workshops/lilypad/20.jpg) \ ![Arduino LilyPad USB](content/workshops/lilypad/21.jpg) 


Stick first LED on the proper place (start from the top one).  Sew (+) with pin 9 (blue line) on LilyPad board and (-) with ground (-) (green line). 

> Note the POSITIVE (+) and NEGATIVE (-) ends of the LED lights. To keep the sewing clean, make sure the negative ends are all pointed leftwards, and the positive ends are pointed rightwards.

*Arduino LilyPad FTDI* and *Arduino LilyPad USB*:

![Arduino LilyPad FTDI](content/workshops/lilypad/22.jpg) \ ![Arduino LilyPad USB](content/workshops/lilypad/23.jpg)

Congratulation! Your first circuit is done! Lets test it. Upload again Blink programme. Don’t forget to change pin number to 9. Does it work?

Let’s go further. Sew another two leds. Connect positive ends to pins 10 and 11. Don’t forget to ground them (green line) – you can sew whole negative ends together. 

*Arduino LilyPad FTDI* and *Arduino LilyPad USB*

![a](content/workshops/lilypad/24.jpg) \ ![b](content/workshops/lilypad/25.jpg)

Try to test it now. Modificate “Blink” program by adding new leds. (If you need help, go to SmartWatch folder and run “Blink_three leds” file).

Let’s add sound. Stick buzzer in the right bottom corner. Sew negative end with existing ground path. Positive end connect:

- with pin 4 at FTDI board
- with pin 3 at USB board

![Arduino LilyPad USB](content/workshops/lilypad/26.jpg)

Check if it’s connected correctly. Go to SmartWatch folder and run `Simple_tone` file. If you hear tones, your buzzer is connected correctly.

It seems that we have completed our circuit, so let’s start with Pomodoro watchstop programme. Our goal is to successively fade out leds to communicate time intervals. When whole leds are bright, that means you are very busy and nobody should disturb you. When whole leds are off, buzzer sound tells you that this is time for a brake.

Or just cook ideal soft-boiled egg…
 
Define led and buzzer pin connection: 

~~~~ {.numberLines}
const int ledPin1 = 9;
const int ledPin2 = 10;
const int ledPin3 = 11;
const int buzzerPin = 4;
~~~~~~~

Define our pomodore cycle time in seconds. The three LEDs will output the the progress of the cycle by slowly dimming down, one after another:

~~~~ {.numberLines}
const int pomodoroCycleLenght = 1*60;
~~~~~~~

Define the lenght of the tone (in seconds) generated when the pomodoro cycles ends.

~~~~ {.numberLines}
const int buzzingTime = 1;
~~~~~~~

Define the frequency of the tone generated when the pomodoro cycles ends.

~~~~ {.numberLines}
const int buzzingFrequency = 2093;  // C7
~~~~~~~

Define controlls the "base" time of the board. A value of 1000 means 1 program second coresponds to 1 real second. You can change this value for debug purpouses.

~~~~ {.numberLines}
const int MILLIS_IN_SECOND = 1000;
~~~~~~~

Afterwards perform setup of the board. This is called by the Arduino framework.

~~~~ {.numberLines}
void setup() {
  //We set all used pins to output mode.
  pinMode(ledPin1, OUTPUT);
  pinMode(ledPin2, OUTPUT);
  pinMode(ledPin3, OUTPUT);
  pinMode(buzzerPin, OUTPUT);
}
~~~~~~~

Generates a tone (square wave) on the provided `speakerPin`. 

The tone will last for `timeInMilliseconds` and have the `frequencyInHertz`.

~~~~ {.numberLines}
void beep (unsigned char speakerPin, int frequencyInHertz, long timeInMilliseconds) {
  int x;
  long halfCycleDelay = (long) (1000000 / frequencyInHertz / 2);
  long cycleRepeats = (long) ((timeInMilliseconds * 1000) / (halfCycleDelay * 2));
  for (x = 0; x < cycleRepeats; x++) {
    digitalWrite(speakerPin,HIGH);
    delayMicroseconds(halfCycleDelay);
    digitalWrite(speakerPin,LOW);
    delayMicroseconds(halfCycleDelay);
  }
}

int time = 0;
~~~~~~~

Next is the main loop method. Called over and over again by the Arduino framework. Each LED presents the passing of one third of the pomodoro cycle time. With time passing, each LED in order will dim down:

~~~~ {.numberLines}
void loop() {
  const int timePerLED = pomodoroCycleLenght / 3; 
~~~~~~~

For each led we first calculate the time relative to it's part of the pomodoro cylce and constrain it to the range `[0, timePerLED]`. We then map this value to a brightness level.

~~~~ {.numberLines} 
  //set LED1 (first part of pomodoro cycle)
  analogWrite(ledPin1, map(constrain(time, 0, timePerLED), 0, timePerLED, 
      255, 0));

  //set LED2 (second part of pomodoro cycle)  
  analogWrite(ledPin2, map(constrain(time - timePerLED, 0, timePerLED), 
      0, timePerLED, 255, 0));

  //set LED3 (third part of pomodoro cycle) 
  analogWrite(ledPin3, map(constrain(time - timePerLED*2, 0, timePerLED), 
      0, timePerLED, 255, 0)); 
~~~~~~~

We now need to wait for exactly one second.

If this is the end of the pomodoro cycle we will emit a buzz for 1000ms. The methods blocks for this time. Otherwise we will simply use the delay function.

~~~~ {.numberLines}
  if(time >= pomodoroCycleLenght - buzzingTime){
	beep(buzzerPin, buzzingFrequency, MILLIS_IN_SECOND);
  } else {
	delay(MILLIS_IN_SECOND);
  }
~~~~~~~

Increment the time by one second, and limit it to the pomodoro cycle lenght.

~~~~ {.numberLines}
  time = (time + 1) % pomodoroCycleLenght;
}
~~~~~~~

It’s time to wear your new smart watch! Get things done, manage your time: plan, track, and visualize your tasks. 

## Second flow

If you still have some enthusiasm left, try to upgrade your smart stopwatch. We will create musical instrument by adding some analog inputs. For this purpose add photoresistors to our circuit. We will generate sound by fading out brightness.

![Arduino LilyPad FTDI](content/workshops/lilypad/27.jpg) \ ![Arduino LilyPad USB](content/workshops/lilypad/28.jpg)

Connect photoresistor to:

- analog pin A0 at FTDI board
- analog pin A2 at USB board

Ground it and additionally sew with power pin (+) on Lilypad board as shown above. 

Did you link it rightly? (go to `SmartWatch` folder and run `Fade_leds` file)

~~~~ {.numberLines}
int photocellPin = 0;
int photocellReading=10;

int LEDpin1 = 9;
int LEDpin2 = 10;
int LEDpin3 = 11;

int LEDbrightness;

void setup(void) {

  Serial.begin(9600);
}

void loop(void) {

  photocellReading = analogRead(photocellPin);
  Serial.println( photocellReading);
  LEDbrightness = map(1024-photocellReading, 0, 1023, 0, 255);

  Serial.println(LEDbrightness);
  analogWrite(LEDpin1, LEDbrightness);
  analogWrite(LEDpin2, LEDbrightness);
  analogWrite(LEDpin3, LEDbrightness);

  delay(100);
}
~~~~~~~

While getting dark leds are getting brighten. Don’t you think this is great signaling for your night bike rides?

Finish keyboard for our smart watch instrument by Add two left photoresistor. Ground them (green path), connect with pin (A1 and A2) and with power.

Our smart watch instrument keyboard is finished.

![Arduino LilyPad FTDI](content/workshops/lilypad/29.jpg) \ ![Arduino LilyPad USB](content/workshops/lilypad/30.jpg)

Time to code:

~~~~ {.numberLines}
// pin definitions
const int photo0Pin = 0;
 
const int led0Pin = 9;
const int led1Pin = 10;
const int led2Pin = 11;

const int buzzerPin = 4;

const int photoMin = 50;  // the value for a fully covered photo cell
const int photoMax = 160;  // the value for a fully uncovered photo cell

void setup(void) {
  // We'll send debugging information via the Serial monitor
  Serial.begin(9600);
 
  // setup output pins
  pinMode(led0Pin, OUTPUT);
  pinMode(led1Pin, OUTPUT);
  pinMode(led2Pin, OUTPUT);
  pinMode(buzzerPin, OUTPUT);
 
  // setup input pins
  pinMode(photo0Pin, INPUT);
}

// the photo cell sensor has major noise. We will use a variation of a moving window average.
int photoAvg = 100;
const int photoAvgSamples = 5;

const int sampleTime = 10;

void loop(void) { 	 
  // read the photo cell value (ADC read value has a range of 0-1024)
  int photo0value = analogRead(photo0Pin);
 
  // normalize the raw sensor value. 0 is a covered sensor. 100 and above is a uncovered sensor.
  photo0value = map(max(photo0value, photoMin), photoMin, photoMax, 0, 100);
 
  // calculate our moving avarage variant
  photoAvg = (photoAvg * (photoAvgSamples-1) + photo0value) / photoAvgSamples;
 
  // output debuging information
  Serial.println(photoAvg);
 
  // we are only interested in values under 100 (a somewhat covered sensor)
  if(photoAvg < 100) {
    digitalWrite(led0Pin, HIGH);
    // we map our range 0->100 to a range of 6000->2000 (note the inversion).
    beep(buzzerPin, map(photoAvg, 0, 100, 6000, 2000), sampleTime);
  } else {
    digitalWrite(led0Pin, LOW);
    delay(sampleTime);
  }
}

// Generates a tone (square wave) on the provided speakerPin. 
// The tone will last for timeInMilliseconds and have the frequencyInHertz. 
//The method will block for the output time
void beep (unsigned char speakerPin, int frequencyInHertz, long timeInMilliseconds) {
  int x;
  long halfCycleDelay = (long) (1000000 / frequencyInHertz / 2);
  long cycleRepeats = (long) ((timeInMilliseconds * 1000) / (halfCycleDelay * 2));
  for (x = 0; x < cycleRepeats; x++) {
    digitalWrite(speakerPin, HIGH);
    delayMicroseconds(halfCycleDelay);
    digitalWrite(speakerPin, LOW);
    delayMicroseconds(halfCycleDelay);
  }
}
~~~~~~~

I’m sure your creativity will allow you to develop more ideas using this circuit. How about memory game? Rules: remember and repeat sequences of flashing lights. Game starts with one light. In every round additional light is added to sequence. 
Try to write it by yourself or go to SmartWatch folder and run `Memory` file.

But, it is not finished yet. Why not to add button to switch between two programs? 

We will use press-stud. Top part is already connected. Your job is to sew bottom part near pin 3 and connect it. 

![](content/workshops/lilypad/31.jpg)

Try to modify code a bit – it’s simple! If little help is needed go to SmartWatch folder and run “Switch” file.

 
## Additional sources

Here is a list of links to specifications, tutorials and inspirations:

- Lilypad arduino specyfication <http://arduino.cc/en/Main/arduinoBoardLilyPad>
- Lilypad tutorials  <http://lilypadarduino.org/>
- Wearable inspirations <http://learn.adafruit.com/category/flora>

