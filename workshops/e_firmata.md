\newpage
\thispagestyle{empty}
\mbox{}

\newpage

![](workshop_images/firmata.jpg)

\customtitlepage{Tinkering with Arduino}

> This tutorial teaches Arduino 101 and let's you make cool stuff using one of the simple and easy to learn programming languages - Python, Javascript (Node.js) and Ruby.

>Parts of it are similiar to "Python, Ruby and Arduino sitting in the tree" because it also uses "Firmata" protocol. Do both workshops if you're really into it.


### Authors

__Meet Swift__ is a free-agent evangelist and mad scientist hacker. Swift has made it his personal mission to enable developers by helping them get the tools and resources they need to make awesome, creative stuff. He is the author of BreakfastSerial, a framework for interacting with Arduinos in Python, and the founder of Hacker League, the world's largest and premier platform for hackathons. Formerly, Swift was a developer evangelist at SendGrid, an engineer at Crowdtap, and a champion crab walker.

\newpage

# Tinkering with Arduino

## Overview

During this workshop you will learn the basics of communicating with an Arduino using your favorite scripting language (Python, Ruby, or Javascript).

We’ll start with the basics like blinking an LED and reading data from a button, and by the end of the workshop we’ll work our way up to a fully functioning light switch that you can control from a simple Web Application.

This workshop is open to hackers of all skill levels.  Even if you’ve never touched an Arduino before, we’ll help you get from zero to “Hello World” in no time flat.

## Preparations

To complete this workshop, you only really need two things:

### A computer with the Arduino IDE and drivers installed on it.
 
You can download the latest version of the Arduino IDE (Version 1.0.5) and drivers from the official Arduino website. There are Mac, Windows, and Linux binaries available: <http://arduino.cc/en/Main/Software#toc1>

### Working Python, Node.js, or Ruby environment.

We’re going to be using a serial connection to communicate with the Arduino using one of  your favorite languages.  In order to do this, you need to have a working environment setup on your computer.

### Python

If you’re going to be using python, make sure you have Python 2.7 and PIP installed.  The library we’ll be using, BreakfastSerial does have Windows support.  You can download a copy of python on the official website: <http://www.python.org/getit/>.

Once you have Python installed, make sure you can install the BreakfastSerial library:

	$ pip install breakfastserial

### Node.js

If you’re going to be using Node.js, make sure you have the latest stable version of node installed (Version 10.25 as of 2/14/14). The library we’ll be using Johnny-Five does have Windows support.  You can download a copy of Node.js from the official website: <http://nodejs.org/>.

Once you have Node.js installed, make sure you can install the Johnny-Five library:

	$ npm install johnny-five

### Ruby

If you’re going to be using Ruby, make sure you have Ruby 1.9.3 or higher installed.  The library we’ll be using Artoo does NOT have Windows support.  If you’re using Windows, we can set you up with Python or Javascript instead (sorry!). You can download Ruby from the official website: <https://www.ruby-lang.org/en/downloads/>.

Once you have Ruby 1.9.3 or higher installed, make sure you can install the Artoo gem and the serialport library:

	$ gem install artoo-arduino
	$ gem install hybridgroup-serialport

## Main flow

### Learn about the layout of an Arduino and the components you have.

Goal: Understand the basic layout of an Arduino board and the components we have.

Arduinos look a lot more complicated than they actually are.  Let’s learn about the board and how it works.  

The board you have in front of you is an Arduino Uno, which is the basic Arduino board.  During this workshop, there are three components that you will need to interact with:

- __The USB Interface__ - We talk to our Arduino using a USB serial connection to our computer.  This is where we connect them.

- __The Ground Ports__ - You’ll see a number of tiny square holes around the outside of the board.  Each of them has a label next to it that describes the purpose.  The ports labeled “GND” are for Grounding.

- __The Digital Ports__ - On one side of the board, you will see a “Digital” label and ports numbered from 0 to 13.  These are the digital pins that all our diagrams will use.  

These ports provide power and can be turned on and off.

During this workshop, you will be building a series of circuits.  You can think of a circuit like a simple loop.  In order for the circuit to work, one end must be connected to a port that supplies power and the other end must lead to group.

### “Hello World” in Arduino.

__Goal: Blink an LED using the Arduino language and IDE.__

First thing first, let’s get our Arduino to blink an LED.  LEDs have two ends - the long end goes to power and the short end goes to ground.  We can insert the long end of an LED into the pin on our board labeled “13” and the short end into the “GND” pin next to it to create a simple circuit.  (See Diagram)

Making the LED blink is pretty simple. The Arduino IDE actually has the code pre-written for us so we don’t have to even write it ourselves. Open it up by clicking: *File > Examples > 01.Basics > Blink*

The code is pretty well documented, so read it and get a feel for how it works.  When you’re ready click the “Upload” button and watch your very first LED blink!

### Introduction to firmata

__Goal: Understand what firmata is an how to upload it to our Arduino.__

Firmata is a generic protocol for communicating with a microcontroller using software on a computer over a serial connection. You can think of it like an API for talking to Arduinos. We compile the firmata program and push it to our board.  Then a program can send and receive commands to/from the Arduino.

There are implementations of firmata in a bunch of languages and flashing it on to our Arduino is super easy using the Arduino IDE.  Open up the IDE again and click on: *File > Examples > firmata > Standardfirmata*.

This should open up a new window that contains the code we need to upload to your Arduino so it “speaks” firmata.  Click “Upload” to compile the code and push it to the board.  

> __Hint__: You should see the LED flash a few times and then it should stop.

### “Hello World” in your favorite language.

__Goal: Blink an LED using either Javascript, Python, or Ruby.__

Now that we have firmata running on our Arduino board, we can start using our favorite scripting language to control it.  Let’s rewrite our “Hello World” example in either Python, Javascript, or Ruby.  We already have the LED wired up, so no need to worry about that.

### Python

To communicate with the Arduino in Python, we’ll be using a library called BreakfastSerial.  You should already have it installed when you setup your python environment.   Using BreakfastSerial is really simple.  The library gives us objects that represent the real world components in our circuit.  For example, there is an Arduino object which represents an arduino and an Led object which represents an LED.  Here’s how you import them:

	from BreakfastSerial import Arduino, Led

Now that we have them imported, we can create new instances of the objects and use them to interact with our LED.  For our example, we’ll need a board object and an LED that lives on pin 13.

	board = Arduino()
	led = Led(board, 13)

The led object has methods that we can call to effect the state of the real world LED.  To turn it on, you would do the following:

	led.on()

There are also methods for off, toggle, and blink.  Make the led blink every second and then move on to the next step.

### Node.js

To communicate with the Arduino in Node.js, we’ll be using a library called Johnny-Five. You should already have it installed when you setup your node environment. Using Johnny-Five is really simple.  The library gives us objects that represent the real world components in our circuit.  For example, there is a Board object which represents an arduino and an Led object which represents an LED.  Here’s how you create a board:

	var five = require("johnny-five"), 
		board = new five.Board();

Every new Board object emits a “ready” event when the board is connected.  It takes a callback function that you can then instantiate new objects within.

	board.on(“ready”, function() {
		led = new five.Led(13);
	});

The led object has methods that we can call to effect the state of the real world LED.  To turn it on, you would do the following:

	led.on()

There are also methods for off, toggle, and blink.  Make the led blink every second and then move on to the next step.

### Ruby

To communicate with the Arduino in Ruby, we’ll be using a library called *Artoo*. You should already have it installed when you setup your ruby environment. Using Artoo is really simple. The library gives us devices that represent the real world components in our circuit. For example, there is a board device which represents an arduino and an led device which represents an LED. In order to connect to the board, you’ll need to know what Serial Port it is connected to.  You can get this from the Arduino IDE by clicking on Tools > Serial Port and seeing what is checked.

Here’s how you create a board and led:

	require 'artoo'

	connection :firmata, :adaptor => :firmata, :port => '/dev/tty.usbmodem1411'
	device :board
	device :led, :driver => :led, :pin => 13

Every artoo program has a “work” loop that you can access objects from. For example we can interact with our LED from the work loop.  The led object has methods that we can call to effect the state of the real world LED.  To turn it on, you would do the following:

	work do	
		led.on
	end

There are also methods for off and toggle.  Make the led blink every second and then move on to the next step.

### Reading data from a Button.

__Goal: Build a simple button circuit and print out “Button Pressed” whenever someone pushes the button.__

So far we’ve only seen how to write data to the Arduino, but the Arduino is capable of reading data as well.  We do this using sensors like buttons, knobs, temperature, sound, and so on.  In your kit you have a button, which you can wire up according to the following diagram.

### Python

Just like the Led, we need to import a Button object from BreakfastSerial to be able to use it.  You instantiate a new button by passing it a reference to the board and the pin number that the button is connected to.  In our diagram, the pin number is “8”.

	from BreakfastSerial import Arduino, Button
	
	board = Arduino()
	button = Button(board, 8)

Our new button object has methods like “down”, “up”, and “hold”, which we can use to tap into events as the occur.  Each of these methods takes one argument, which is a function.  That function gets called when someone presses the button.  For example:

	button.hold(play_some_sound)

When ever someone presses and holds the button down, a function called “play_some_sound” is called.

Now write a program that prints out “Button Pressed” whenever someone presses your button.

> __Hint__: If you python program exits immediately after you start it, that’s because there are no  other actions on the stack and it’s exiting by default. You can solve this by starting your program with the “-i” flag or manually adding a REPL at the end of your program.

> __Stuck?__  Check out this example: <https://github.com/theycallmeswift/BreakfastSerial/tree/sw-update-examples#push-a-button_>

### Node.js

Just like the Led, we need to instantiate a new five.Button object within our “ready” loop to be able to use it.  Instantiating a new button takes one argument, which is the associate pin number. In our diagram, the pin number is “8”.

	var button = new five.Button(8);

Our new button object has methods like “down”, “up”, and “hold”, which we can use to tap into events as the occur.  Each of these methods takes one argument, which is a function. That function gets called when someone presses the button. For example:

	button.on(“hold”, function() {
		// DO SOMETHING HERE
	});

Now write a program that prints out “Button Pressed” whenever someone presses your button.

> __Stuck?__ Check out this example: <https://github.com/rwaldron/johnny-five/blob/master/docs/button.md>

### Ruby

Just like the Led, we need to tell our program that there is a button device to be able to use it.  We need to indicate which pin it lives on to be able to use it.  In our diagram, the pin number is “8”.

	device :button, :driver => :button, :pin => 8

Now in our work loop, we can create a new listener for a “push” event on our button.  The push event takes in a proc, which is a function that gets called every time the event happens.

	on button, :push => proc {
		# DO SOMETHING HERE
	}

Now write a program that prints out “Button Pressed” whenever someone presses your button.

> __Hint__: Does your button seem a bit slow to react to you pushing it?  This is a know issue with the Artoo library, just press and hold the button a little longer than you would expect to.

> __Stuck?__ Check out this example: <http://artoo.io/documentation/examples/ruby/firmata_button/>

### Connect the dots - Make a lightswitch!

__Goal: Build a functional light switch. When you press the button, the light should come on. When you press the button again, the light should go off.__

Now that we’ve managed to turn an LED on and off and we can read data from a button, how do we combine the two concepts to create a simple light switch?

> __Hint__: You can reuse a lot of the code we wrote for the previous exercises.  Each library has a “toggle” method that we can use to make things easier.

## Additional tasks

Do you feel good with your skills? If so let’s get to the next step if not keep on experimenting or ask us for some help.

### Build a simple web interface for your Light Switch

Using a simple server, create a web interface for your light switch.  You should display the current state of the light (on vs off) and be able to toggle between them from both the web and the button on the Arduino. 

If you’re looking for a simple server, here are some that you might want to check out:

- [Flask (Python) - http://flask.pocoo.org/](http://flask.pocoo.org/)
- [Express (Node.js) - http://expressjs.com/](http://expressjs.com/)
- [Sinatra (Ruby) - http://www.sinatrarb.com/](http://www.sinatrarb.com/)


### Bonus: Integrate either SendGrid or Twilio’s API 

So you can control you light via email or SMS message!

### Explore interacting with some of the other available components

Ask one of the workshop leaders for some advanced components and practice working with them in your language of choice.  You may have to refer to the documentation for the library you’re using to find out what components are available.
