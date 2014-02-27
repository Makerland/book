\newpage
\thispagestyle{empty}
\mbox{}

\newpage

![](workshop_images/bricksbots.jpg)

\customtitlepage{Bricks & Bots}

>In this tutorial you will get a chance to learn how to build and program robots with Lego Mindstorms. Build your own arm, robot or car and program it without any programming knowledge or use language you already know as a weapon of choice! 

>__Following materials are for advanced only. For beginners flow - just attend the workshop :)__

### Authors

__Krzysztof Bieńkowski__ is a Lego builder and the owner of [Roboty i Spółka](http://robotyispolka.pl/), Krzysztof organizes robots workshops for children, on which in cooperation with his friends he shows how to build and program Lego Mindstroms Robots. He gained professional experience during his studies at Warsaw University of Technology. Krzysztof is a young and ambitious person, who has a great contact with children and a huge knowledge he wants to share with them. Therefore he spends a lot of time constructing and programming robots with young people. He enjoys teaching and organizing events devoted to science, which capture children's imagination and develop their creativity. On the workshops everyone not only has a lot of fun and joy with Lego bricks but also discovers the world of robotics.

\newpage

# Bricks & Bots

## The Lego Mindstorms 

The Lego Mindstorms is a series of blocks, that have been produced since 1998 by the Lego Group. Originally the idea of the series supposed to be very simple – that is, to combine the well-known and appreciated the Lego Technics series with a series of electronic sensors, a servomechanism. All this controlled by a computer central unit. In the process the Lego had been released on the market of energetically developing technology branch at that time - robotics. After years of endeavor the engineers succeeded in achieving the Mindstorms series with its currently cult status. 

A true power of blocks in this series underlies in the simplicity (typical for the Lego blocks) of modifying structures, as well as in possibilities of programming in different ways. For instance, the most basic way to program a developed system is by a suitable programming environment designed by the Lego.

It’s been 16 years since the Mindstorms series debut and both the systems used in it and its users have incredibly changed. The blocks had become widely available and then some nerds succeeded in bleeding them dry. A great variety of additional firmware has been created – it increased abilities of the Brick, as well as many projects allowing us to create programs in different programming languages and then to download them to the Brick (the central unit). 

Below there are described two projects: PyNXC for Python and leJOS NXJ for Java.

## PyNXC - Python

PyNXC is one of the two most popular projects, allowing users (not only the experienced but also the beginning ones) to use the Python language to programming the Brick of the Lego Mindstorms. The PyNXC works as a converter of a code written in Python language to NXC (*Not Exactly C*) and then it downloads it in this form to the Brick. Finally, you can see the effects of your program :)

### Have a glance at PyNCX 

Let’s take a look at this fragment of code:

~~~~ {.numberLines}
def main():
    DefineSensors(TOUCH, None, None, None)
    OnFwd(OUT_AC, 75)
    while SensorVal(1) != 1:
        pass Off(OUT_AC)
~~~~~~~

Firstly, you should take notice of the simplicity and clarity of the program. It engages the engines and the sensor of the Mindstorms set.

In the first line we declare main function, which will be our main program. A number of operations in the function are included: 

* declaration of sensors to the appropriate ports (a touch sensor on the first port), 
* start engines attached to ports A and C to move forward (75% of the total power), 
* evaluate the statement and see if the value from sensor 1 is different than 1 (it means that unless we push the sensor, we won’t leave the loop), 
* turn off the A and C engines. 

Let me remind you that in the Python language you can’t use semicolons at the end of the line, but I’m sure you already know that. 

As simple as that.

### The installation and PyNXC requirements 

To create a program in the previous paragraph, we can use really simple text editor and then save a prepared script with a.py extension (however it’s better to use a professional editor with at least a syntax colouring).

Suppose you want to download to the Brick any of the programs written in Python, you should use PyNXC. To do that on our computer, the following conditions must be met: 

* the Python 2.5 or 2.6 (it works fine on 2.5.4 version)installed
* the wxPython 2.8.7.1 installed

All of that can be working with another softs, but we recommend to install exactly those mentioned by us. Plus it’s available on-line for free. 

The last component is the *pynxc-0.1.6* itself, which can be downloaded from the project site (<https://code.google.com/p/pynxc/downloads/list>), and then unpacked to the hard drive. 

If we do it all properly, after running the `pynxc.pyw` file we’ll see a window with this kind of contents:

![](workshops/bricksbots/1.jpg)

The environment is done!

### The first compilation and download to the Brick 

To compile already written program, you have to open it by unrolling a **File** label and then select **Compile** from the **Program** label. 

You can do the same thing (and download it to a NXT controller) from a console level by entering the command below:

`$ ./pynxc.pyx --download program_name.py`

If all of it has compiled successfully, we can move on to downloading a program to the Brick. We select **Download** from the **Program** label and wait for the effects.

Don’t forget to plug in and turn on the controller!

The program is finished, so now you can start it and observe the effects :)

### PyNXC in details

How to learn more about programming with PyNXC? We encourage you to familiarize yourself with some examples in the *tutorial_samples* folder - a Python version of programs from the tutorial *Programming LEGO NXT Robots using NXC* (<http://bricxcc.sourceforge.net/nbc/nxcdoc/NXC_tutorial.pdf>). Since the PyNXC is a wrapper around NXC, you may find it necessary to repeatedly look into the tutorial.

Well, if you don’t feel like going into detailed documentation, we can show you something to let you create a few neat programs for a good start.

### Controlling engines and a for loop

Let’s take a look at the example. We define constant move time (provided in ms), and then we repeat moving forward five times (with both engines) with a rotation at the end (only the C engine). The *"Wait"* instruction informs us about the time the application needs to wait for another instruction to make. It’s absolutely essential, especially when we determine a speed and a direction of the engines. At last, after finishing a loop, we turn both engines off.

~~~~ {.numberLines}
DEFINE MOVE_TIME = 500
DEFINE TURN_TIME = 360

def main():
    a=5
    for repeat in range(a):
        OnFwd(OUT_AC, 75)
        Wait(MOVE_TIME)
        OnRev(OUT_C, 75)
        Wait(TURN_TIME)
    Off(OUT_AC)
~~~~~~~

### Moving down the spiral

In this particular case a robot moves down the spiral and with every transition it increases a move time in both of the engines. This example illustrates the use of variables and a way to comment a code.

~~~~ {.numberLines}
DEFINE TURN_TIME=360

def main():
    move_time = 200           # set the initial value
    for repeat in range(50):
        OnFwd(OUT_AC, 75)
        Wait(move_time)       # use the variable for sleeping
        OnRev(OUT_C, 75)
        Wait(TURN_TIME)
        move_time += 200      # increase the variable
    Off(OUT_AC)
~~~~~~~

### The ultrasonic sensor

A real robot has to have sensors, which allows to detect objects in space. In this example we can see how to declare an ultrasonic sensor, so that the robot can move forward until there are no obstacles in a 15 cm distance. Provided the robot detects something, it starts to rotate for 800 ms (it uses the C engine) and goes back to the beginning of the loop to look for another objects.

~~~~ {.numberLines}
DEFINE NEAR = 15

def main():
    DefineSensors(None,None,None,EYES)
    while True:
        OnFwd(OUT_AC,50)
        while SensorVal(4)>NEAR:
            pass
        Off(OUT_AC)
        OnRev(OUT_C,100)
        Wait(800)
~~~~~~~

### The *if* construction and the light intensity sensor 

In this example a robot performs the line follower algorithm. The light intensity sensor has been defined for a third port (0 – dark, 100 – light). After leaving the line to a white surface, the robot will start to rotate and it won’t get back to move forward, unless a black line is detected.

~~~~ {.numberLines}
DEFINE THRESHOLD = 40

def main():
    DefineSensors(None,None,LIGHT,None)
    OnFwd(OUT_AC, 75)
    while True:
        if SensorVal(3) > THRESHOLD:
            OnRev(OUT_C, 75)
            Wait(100)
            while SensorVal(3) > THRESHOLD:
                pass
            OnFwd(OUT_AC, 75)
~~~~~~~

### Functions

A function has been defined in this particular example. It allows us to send these arguments: a power of engine and a driving length. It’s very effective to use that kind of functions, if we are going to create more fully developed programs.

~~~~ {.numberLines}
def turn_around(pwr,turntime):
    OnRev(OUT_C, pwr)
    Wait(turntime)
    OnFwd(OUT_AC, pwr)

def main():
    OnFwd(OUT_AC, 75)
    Wait(1000)
    turn_around(75, 2000)
    Wait(2000)
    turn_around(75, 500)
    Wait(1000)
    turn_around(75, 3000)
    Off(OUT_AC)
~~~~~~~

### Parallel tasks and mutex variables

In order to execute two parallel tasks, you can use the Precedes() function to queuing multiple concurrent tasks. It’s important to use so-called mutex variables in order to block the access to engines (and then release it). We can see here how to create a program running two different tasks in parallel, at the same time they don’t collide with each other and operate on the same hardware. Our main program is carried out in the main() function.

~~~~ {.numberLines}
moveMutex=Mutex()

def task_move_square():
    while True:
        Acquire(moveMutex)
        OnFwd(OUT_AC, 75); Wait(1000)
        OnRev(OUT_C, 75); Wait(850)
        Release(moveMutex)

def task_check_sensors():
    while True:
        if SENSOR_1 == 1:
            Acquire(moveMutex)
            OnRev(OUT_AC, 75); Wait(500)
            OnFwd(OUT_A, 75); Wait(850)
            Release(moveMutex)
            
def main():
    SetSensor(IN_1,SENSOR_TOUCH)
    Precedes(task_check_sensors, task_move_square)
~~~~~~~


## leJOS NXJ

One of the best solutions, as far as it goes about programming the Lego Mindstorms in Java, is leJOS NXJ. It consists of the alternative firmware (running on a simple Java virtual machine). It was ported on the NXT Brick in 2006 and since then the powerful API has been developed, allowing programmers from the entire world to fully enjoy a Java potential while programming robots of their own construction. Apart from the  alternative firmware downloaded to the NXT Brick, the leJOS NXJ includes package of necessary tools, which is essential to compile and download created programs as well as the NXJ API itself. This tutorial will guide you through the process of installation and configuration of the programming environment. It will also help you to understand the basics of using the leJOS NXJ in programming the Lego Mindstorms. Unfortunately, it WON’T tell you how to flash the Brick to the leJOS NXJ software – let us handle that. All you have to do is to ask for a prepared one :) 

### First contact with the leJOS NXJ

Let’s take a look at the short code below:

~~~~ {.numberLines}
import lejos.nxt.Button;

public class HelloWorld {
  public static void main (String[] args) {
    System.out.println("Hello World");
    Button.waitForAnyPress();
  }
}
~~~~~~~

It is already a tradition that every first program in a new programming language should be the “Hello World”. We can’t be worse than that.
 
If you have just a little experience in Java, the code from above won’t be a riddle for you, but it doesn’t look so bright if you have none. Well, don’t worry then. We strongly suggest you to look for some “Java for dummies” online tutorials and get some basics. It will really help you with understanding the examples from this tutorial.  

Getting back to code from the above – it generates message “Hello World” on the display of the Brick, and then waits for user to press any button on the mentioned Brick. We can’t forget about including an appropriate package that allows us to use the Button class.

Easy-peasy.

### Preparation and installation of the leJOS NXJ

To be able to download your own programs to the Brick, it is necessary to install some additional software. You can find a short and helpful instruction below.

1. Download and install Java Development Kit (JDK, not JRE!) version 1.5, 1.6 or 1.7. The leJOS NXJ only works with a 32-bit version of the JDK and JRE, so even if you have a 64-bit system, you should select a 32-bit version of the JDK. If you are going to compile your programs, it is essential to have this package on your computer. 
2. Installing Fantom USB Driver allows you to communicate through USB with the NXT. You can obtain it by installing the Lego NXT software or simply just downloading it from: <http://www.lego.com/en-us/mindstorms/downloads/nxt/nxt-fantom-driver/>
3. Download leJOS NXJ 0.9.1 from <http://sourceforge.net/projects/lejos/files/lejos-NXJ/0.9.1beta> (it’s recommended to download a file with samples as well)
4. Install the leJOS NXJ. You need to select the root folder of the JDK; don’t forget to uncheck "Launch NXJ Flash utility" at the end. 
5. Edit environment variables by adding the leJOS’s root folder to the PATH variable (after a semicolon). In the picture you can see how to achieve that under Windows 8.

Remember not to delete a value of the PATH variable, but simply add the leJOS’s path after a semicolon instead. If everything is done correctly, you can test a software by compiling and downloading your very first program to the BRICK!

![](workshops/bricksbots/2.jpg)

### First compilation and downloading to the Brick

You can use almost any text editor while writing programs in Java. However, you should pick one with the ability to color the syntax at least, for your own convenience of course ;) There is a whole bunch of different IDE allowing you to write in Java so we won’t tell you which one to use (however the leJOS creators recommend the Eclipse, mainly because there is a possibility to install plugin responsible for operating the NXT).

To compile and download your program correctly, you will have to name your file the same as your main class with a *.java* extension, in this example it would be HelloWorld.java. Using the console, get into the folder with your program and type the following sentence:

`$ nxjc HelloWorld.java`

The *HelloWorld.class* file prepared this way needs to be linked using this command:

`$ nxjlink -o HelloWorld.nxj HelloWorld`

If everything went without any errors, we can proceed to download program to the Brick. To achieve that write a command in the console:

`$ nxjupload HelloWorld.nxj`

At this point, your program is happily downloaded to the Brick and is waiting for its first run. All you need to do is to select it from the menu and play. Congratulations on writing and executing your very first Java program on the Lego Mindstorms!

### Something more about the leJOS NXJ

While writing some more advanced Java programs destined to run on the Lego Mindstorms, it’s very important to familiarize with the NXJ API (except of knowing basics of Java), excellently described under: <http://www.lejos.org/nxt/nxj/api/index.html>. It’s really helpful to use programs from samples downloaded in step 3 while writing your own program – they can give you a good look how to use Java with the NXJ API. Try to improve them!  

However, if you don’t feel like reading tons of documentation, we will show you some simple but important examples that will help you in writing some useful programs. 

### Controlling the motors and using LCD

Take a look at this example. It is essential for you to include all the important packages at the very beginning. They will make it 
possible to use all of the needed classes. Then, we create a main class where we: 

1. display message on the brick,
2. wait for any button to be pressed,
3. clear the display, 
4. move forward the motor plugged in the port A (without defining its power it will move with a maximum speed).

Then we repeat it for the back-ward moving and stop the motor.

~~~~ {.numberLines}
import lejos.nxt.Button;
import lejos.nxt.LCD;
import lejos.nxt.Motor;
 
public class Motor1
{
    public static void main(String[] args)
    {
        LCD.drawString("Program 1", 0, 0);
        Button.waitForAnyPress();
        LCD.clear();
        Motor.A.forward();
        LCD.drawString("FORWARD",0,0);
        Button.waitForAnyPress();
        LCD.drawString("BACKWARD",0,0);
        Motor.A.backward();
        Button.waitForAnyPress();
        Motor.A.stop();     
    }
}
~~~~~~~

### An advanced motor control,  for , while and variables

In this example we set the motor speed (720°/s) and program it to make two rotations. Thanks to the for loop, every 200 ms built in tachometer registers motor angle in degrees, it also displays it at the same time on the LCD. At the end of the script, we wait for all motors to stop (guaranteed by the while loop) and wait for any button to be pressed to end the program.

~~~~ {.numberLines}
import lejos.nxt.Button;
import lejos.nxt.Motor;
import lejos.util.Delay;
import lejos.nxt.LCD;

public class Motor2 {

     public static void main(String[] args) {
          Button.waitForAnyPress();
          int speed = 720;
          Motor.A.setSpeed(speed);
          Motor.B.setSpeed(speed);
          Motor.C.setSpeed(speed);
          Motor.A.rotate(720,true);
          Motor.B.rotate(720,true);
          Motor.C.rotate(720,true);
          for (int i = 0 ; i < 8 ; i++)
          {
               Delay.msDelay(200);
               LCD.drawInt(Motor.A.getTachoCount(), 0,i);
               LCD.drawInt(Motor.B.getTachoCount(), 6,i);
               LCD.drawInt(Motor.A.getTachoCount(), 12,i);
          }
          while(Motor.A.isMoving()||Motor.B.isMoving() _
                ||Motor.C.isMoving());
          Button.waitForAnyPress();
     }
}
~~~~~~~

### The ultrasonic sensor

This is a really good example how to measure a distance between a robot and an obstacle using the ultrasonic sensor. Firstly, we have to declare in which port the sensor is plugged in (port 4). Then, the while loop will provide us the mentioned distance, as long as the ESCAPE button (a grey one) isn’t pressed. A registered value is given in cm in range between 0 and 255.

~~~~ {.numberLines}
import lejos.nxt.*;

public class SonicTest {
  public static void main(String[] args) throws Exception {
    UltrasonicSensor sonic = new UltrasonicSensor(SensorPort.S4);

    while (!Button.ESCAPE.isDown()) {
      LCD.clear();
      LCD.drawInt(sonic.getDistance(), 0, 0);
    }
  }
}
~~~~~~~

### A touch sensor

The program given below shows us a simple use of a touch sensor. The sensor is declared to operate under the first socket and unless it’s pressed, the LCD won’t display the message and the program won’t stop. Touch sensors are pretty useful as a controller while building robots  operated by men.

~~~~ {.numberLines}
import lejos.nxt.LCD;
import lejos.nxt.SensorPort;
import lejos.nxt.TouchSensor;

public class TouchTest {
  public static void main(String[] args) throws Exception {
    TouchSensor touch = new TouchSensor(SensorPort.S1);
    while (!touch.isPressed()) {
    	// try again
    }
    LCD.drawString("Finished", 3, 4);
  }
}
~~~~~~~

### A scout robot or: how to use Behavior interface while programming robots

On the other hand, this example, illustrate how to write a program fora fully operative scout robot. The main principle of programming this kind of robot is easy: a robot will move forward providing that it doesn’t detect any enemy in its sight. If so, it will run for his life in the other direction.

What a stupid little robot! Programming a robot like this is much easier as long as we use one of the NXJ API implementations called Behavior. The Behavior interface represents an object embodying a specific behavior that belongs to a robot. Each behavior must define three things: the circumstances to make this behavior seize control of the robot, the action to perform when this behavior takes control, a way to quickly exit from the action when the Arbitrator selects a higher priority behavior to take control. If we insert a necessary code in this three sections, we can easily program our first robot scout.

See the example code for the robot here: <https://github.com/Makerland/code/blob/master/workshops/bricksbots/robot.nxj>
