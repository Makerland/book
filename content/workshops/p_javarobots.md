\newpage

![](content/workshop_images/javarobots.jpg)

\customtitlepage{Retro Gaming on Raspberry Pi}

>This tutorial uses low cost Raspberry Pis and displays as a platform for building simple, touch-enabled games.  For the user interface we will be using Java 8 with JavaFX, which is a modern UI framework that supports advanced visual effects, but runs extremely well in constrained embedded devices.  Kits will be provided with everything you need to build a bare-bones console from scratch.  A simple skeleton for the gaming software will be provided, limited only by your imagination!

### Authors

__Stephen Chin__ is a Java Ambassador at Oracle specializing in embedded and UI technology, co-author of the Pro JavaFX Platform 2 title, and the JavaOne Content Chair. He has been featured at Java conferences around the world including Devoxx, JFokus, OSCON, JFall, GeeCON, JustJava, and JavaOne, where he thrice received a Rock Star Award. 

\newpage

# Retro Gaming on Raspberry Pi

## Overview

We will bring the ingredients, and you get to do the baking!

With an price tag of around $35, the Raspberry Pi is a credit-card sized computer that offers developers a springboard to quickly dive into the embedded world of programming. It includes an ARM chip that is powerful enough to run a full version of Java SE including JavaFX.  With the use of external libraries like Pi4J you can control the GPIO pins to interact with a wide array of hardware components.

You will get a Raspberry Pi to hack on during this session, along with recipes for creating projects that demonstrate the power of Java on a very accessible embedded platform.

## Beginner Lab

### Setting up your Raspberry Pi

In your lab kit, we have already provided everything you need to create a mini-computer for developing your first JavaFX Game, including setting up and installing all the software on the SD Cards.  However, if you are doing this on your own after the event, please refer to the following setup guide:

<http://steveonjava.com/javafx-on-raspberry-pi-3-easy-steps/>

Also, before we get started a few words about electrical and computer safety: 

* Unplug from wall before wiring
* Get rid of static by touching a metal surface
* Don't touch exposed wires/metal
* Never remove/insert SD Card while power is on

Now we are ready to get started with assembling all your parts.  In your lab kit, you have the following hardware:

* Touch Screen
* SD Card
* Keyboard
* Power Adapter
* LVDS Cable/Board
* Raspberry Pi Model B
* Mini-USB Cable (power)
* Micro-USB Cable (keyboard)

To setup your Raspberry Pi, follow these instructions:

1. Insert the SD Card in to the Pi

    * Will appear upside down when looking at the top of your Pi

2. Insert the HDMI board into the Pi's HDMI jack
3. Connect the Pi power to the HDMI board

    * Use the Micro USB Cable (short one)

4. Slide the LCD cable into the back of the display

    * Side with gold connectors goes up
    * Be careful, the connector is fragile!

5. Connect the USB end to one of the Pi's USB host ports

    * This provides touch input

6. Hook up the USB keyboard

    * Use the Mini USB cable (long one)
 
After completing all the setup, verify your connections and plug in the power. Some good ways to tell if it is working are:

- You should get a bunch of flashing LEDs to indicate booting
- Boot takes approx 30 seconds
- The LCD screen should light up
- Might be dim if the light sensor is obstructed
- And you will should see a Linux boot screen with lots of text

If you run into any issues, check the wiring against the steps above.  Also, don’t hesitate to ask for help form one of the lab instructors. Now that you have the Raspberry Pi booted, time to run the game!
 
### Running your first Retro Game

This section assumes that you have the Pi booted and are looking at the login prompt. To run software on the Raspberry Pi, you first need to login:

* At the login prompt type your username: `pi`
* And enter the password: `raspberry`

Next we will use Apache Ant (a build system for Java) in order to compile and run the game that is already on your SD card:

* Change directory to the project folder: `cd MaryHadALittleLambda`
* Run the build script: `ant`

> Note: If you are doing this from home you can find the code in GitHub here:
>
> <https://github.com/steveonjava/MaryHadALittleLambda>

This may take a couple minutes the first time, but once it finishes compiling you will have your first JavaFX Game running on the Raspberry Pi!

Some things to try include:

* Click the screen to move Mary and her Lambdas
* Or….  Use the keyboard arrows to move Mary and her Lambdas
* Step on different objects in the scene and try to guess what will happen
* Press the “esc” key to exit the game when you are done

### Hacking the Game

This retro game is fairly simple, comprised of only 3 source files and some images for graphics.  Therefore, it makes a great sample application to modify.

You can hack the code directly on device by using the “nano” text editor and running the ant build script to recompile your changes.  Here are the steps you would take to edit the MapObject class:

* Run the nano text editor:  `nano src/sample/MapObject.java`
* Save your changes: `Ctrl+O Enter`
* Exit Nano: `Ctrl+X`
* Compile/Run: `ant`

![](content/workshops/javarobots/2.jpg)

When looking at the MapObject class notice that it is organized by each of the game elements (e.g. Barn, Chicken Coop, Nest).  Some changes that are good to start with include:

* Change the number of lambdas that follow Mary when she enters the **Barn**
* Change the colors the lambdas change to when they go through the **Rainbow**
* Change the scale of the **Fox** when he eats the lambdas.

The changes you can make are limited only by your imagination!  Use this as the basis for your own original game.

## Advanced 

### Preparation

Please make sure you have Java SE 8 installed on your machine IDE for java development is desired, but not required. We recommend to install NetBeans 8.0 (<http://dlc.sun.com.edgesuite.net/netbeans/8.0/beta/>)

### Main Flow

Let's get some basic information before we go to the exercises. 

__Getting started with external hardware__:

First lets have a look at the GPIO pins on the RPi.  

![](content/workshops/javarobots/3.jpg)

The GPIO connector has a number of different types of connection on them:

* General Purpose Input Output, (GPIO)
* I2C interface pins
* SPI interface pins
* Serial Rx and Tx pins

__Devices to be used in the lab__:

In this lab we are going to be using:

* **LED:** A light-emitting diode (LED) is a two-lead semiconductor light source that resembles a basic pn-junction diode, except that an LED also emits light. The LED is already attached to the Raspberry Pi students will be using; it’s attached on pins 7 and 9. 
* **Temperature sensor:** Temperature sensors are devices used to measure the temperature of a medium. In this lab we will be using the BMP180.
* **Accelerometer:** An accelerometer is an electromechanical device that will measure acceleration forces. These forces may be static, like the constant force of gravity pulling at your feet, or they could be dynamic - caused by moving or vibrating the accelerometer.  In our lab we will be using the MPU9150 which includes an accelerometer
* **Gyroscope:** A gyroscope is a device for measuring or maintaining orientation, based on the principles of angular momentum.  In our lab we will be using the MPU9150 which includes a gyroscope

__BMP180 Barometric Pressure/Temperature/Altitude Sensor__:

This precision sensor from Bosch is the best low-cost sensing solution for measuring barometric pressure and temperature. Because pressure changes with altitude you can also use it as an altimeter! The sensor is soldered onto a PCB with a 3.3V regulator, I2C level shifter and pull-up resistors on the I2C pins. 

![](content/workshops/javarobots/4.jpg)

This board is 5V compliant - a 3.3V regulator and a i2c level shifter circuit is included so you can use this sensor safely with 5V logic and power.

Complete data sheet can be found here: <http://www.adafruit.com/datasheets/BST-BMP180-DS000-09.pdf>

___9 Degrees of Freedom - MPU-9150 Breakout__:

![](content/workshops/javarobots/5.jpg)

The 9DOF MPU-9150 is the world’s first 9-axis MotionTracking MEMS device designed for the low power, low cost, and high performance requirements of consumer electronics equipment including smartphones, tablets and wearable sensors. And guess what? You get to play with it.

This breakout board makes it easy to prototype with the InvenSense MPU-9150 by breaking out all the pins you need to standard 0.1" spaced headers. The board also provides I2C pullup resistors and a solder jumper to switch the I2C address of the device.

The MPU-9150 is a System in Package (SiP) that combines two chips: the MPU-6050, which contains a 3-axis gyroscope, and 3-axis accelerometer. The part is offered in a 4x4x1mm LGA package and is upgrade-compatible with the MPU-6050 integrated 6-axis MotionTracking device, providing a simple upgrade path and making it easy to fit on space constrained boards.

__Software to be used: Java SE Embedded and Pi4J libraries__:

Because we are going to be using Java SE Embedded, we don’t really have any library for connecting peripherals.  For this reason we are going to be using pi4j libraries.

Please make sure you notice the difference in pin numbering used by Pi4J (next image), compare with the default Raspberry Pi numbering (previous image).

![](content/workshops/javarobots/6.jpg)

### Exercises

__Exercise 1: Turning on an off a LED__

Objective: Get started with GPIO in the Raspeberry Pi.

In this exercise we are going to turn on and off the LED included in the lab kit.  For your convenience, copy the following code in your preferred IDE, compile and transfer the generated jar file to the pi.  Execute and make sure the lights goes on and off.

~~~~ {.numberLines}
package gpiotest;

import com.pi4j.io.gpio.GpioController;
import com.pi4j.io.gpio.GpioFactory;
import com.pi4j.io.gpio.GpioPinDigitalOutput;
import com.pi4j.io.gpio.RaspiPin;
import java.util.logging.Level;
import java.util.logging.Logger;

public class GPIOTest {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        final GpioController gpio = GpioFactory.getInstance();
        final GpioPinDigitalOutput led1 = 
             gpio.provisionDigitalOutputPin(RaspiPin.GPIO_00);
        
        // continuously blink the led every 1/2 second for 15 
        // seconds
        led1.blink(500, 15000);
        
        System.out.println(" ... the LED will continue blinking 
                             until the program is terminated.");
        System.out.println(" ... PRESS <CTRL-C> TO STOP THE 
                             PROGRAM.");
        
        // keep program running until user aborts (CTRL-C)
        for (;;) {
            try {
                Thread.sleep(500);
            } catch (InterruptedException ex) {
                Logger.getLogger(GPIOTest.class.getName()).log(
                    Level.SEVERE, null, ex);
            }
        }
    }
}
~~~~~~~

__Exercise 2: Sensing Temperature__:

Objective: Getting started with I2C on the Raspberry Pi

In this exercise we are going to try I2C on the Raspberry Pi using the temperature sensor. 
If you pay attention to the Raspberry Pi pins you will see that it has two pins for I2C, one for data's bus (SDA) and one for the clock (SCL).

![](content/workshops/javarobots/7.jpg)

I2C is not enabled by default on the RPi, and there are few steps you need to follow.

**Enabling I2C in the RPi**

* First go to: */etc/modules* and add the following lines:

    * `i2c-bcm2708`
    * `i2c-dev`

* Install **i2c-tools**. This is not required, but it's very handy for detecting devices and making sure everything works properly.
  
    * `sudo apt-get install python-smbus`
    * `sudo apt-get install i2c-tools`

* There is a file called *raspi-blacklist.conf*, and by default SPI and I2C are part of this black list! 
  
    * Edit */etc/modprobe.d/raspi-blacklist.conf* and comment out the lines

        * `blacklist spi-bcm2708`
        * `blacklist i2c-bcm2708`

**Connecting the Gyroscope/Accelerometer to the Pi**

Connecting the board and the RPi is pretty straightforward.  I2C requires pullup resistors,  but the RPi provide them, so we just need to connect the BMP180 directly to the Pi, following the next diagram:

![](content/workshops/javarobots/8.jpg)

**Verifying the communication**

Once we connect the board to the RPi, we can continue to check if we can actually see it as a I2C device.
 
* Try running on your pi: `sudo i2cdetect -y 1` or `sudo i2cdetect -y 0`.  (0 for the 256 Pi model B). 
* You should be able to see your device on the table.  It shows shows two I2C devices, one at address 40 and the second on address 70.
* You should also see a couple of new entries under /dev:

    * `spidev0.0`
    * `spidev0.1`
    * `I2c-0`
    * `I2c-1`

* If don't see any of these entries, try running: `sudo modprobe i2c-dev`

Download, study and run the following code on the Pi:

<https://github.com/makerland/code/blob/master/content/workshops/javarobots/Sensor.java>
