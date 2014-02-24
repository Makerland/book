# Python and Ruby sitting in a tree

## Overview

During this workshop you will learn how to load prepared program onto Arduino and use it with PC or Mac running Python or Ruby. You’ll blink a LED, check temperature/humidity/light intensity, measure distance or detect motion. All this using only couple lines of code!

## Preparations

### Arduino IDE installation

To install Arduino IDE, follow guides for your operating system:

- Windows: <http://arduino.cc/en/guide/windows>
- OS X: <http://arduino.cc/en/Guide/MacOSX>
- Linux: <http://playground.arduino.cc/Learning/Linux>

### Connecting the wires and sensors

At the end of this workshop, your breadboard will look like this:

![](workshops/pythonruby/complete_bb.jpg)

Along with Arduino you will need:

- a breadboard (white board with holes ;))
- DHT11 temperature/humidity sensor (the small blue box with holes)
- BH1750 light sensor module
- HC-SR04 ultrasonic ranging module (which looks a lot like Wall-E)
- HC-SR501 PIR motion detector (looks like a dome)
- pack of colorful wires


You don’t have to connect all the wires right now, as we’ll explain everything step by step in later parts of this workshop.

If you never used a breadboard before, you may wonder how all those holes are connected with each other. Here is a small cheat sheet for you:

![Breadboard Cheat Sheet](workshops/pythonruby/breadboard_connections.jpg)

### Installation of Python or Ruby

### Ruby

To install Ruby you should, depending on your operating system:

- Windows: download and install RubyInstaller from <http://rubyinstaller.org/downloads/>
- OS X: if you have Mountain Lion (10.8) or Mavericks (10.9) you already have it
- Linux: install ruby with your distribution package manager

### Python

Python comes out of the box with both OS X and Linux. If you’re Windows user, you can follow this guide: <http://docs.python-guide.org/en/latest/starting/install/win/>

## Main flow

### Setting up your Arduino

You won’t actually program Arduino using Ruby or Python. You can do it but it’s a lot of hustle, so we chose more popular and easier way: communicate with Arduino using serial port. For this to work, you need to load Arduino with our small code which listens for commands and takes action like turning a LED on and of, or returns a value from one of our many sensors.

If you followed Arduino guide (which we hope you did), you should know how to upload a program to the board. Download ZIP file for this workshop: <https://github.com/meal/makerland-workshop/archive/master.zip>

In *ArduinoSensors* directory you’ll find *ArduinoSensors.ino* file. Open it in Arduino IDE and upload to the board.

> Feel free to dig into this code. It contains a lot of comments which explain how it works. You can add new sensors or output devices like servos or relays. Play around with it!

After loading this sketch (BTW Arduino calls programs “sketches” and we’ll use both names in this workshop), open *Serial Monitor* in Arduino IDE (loupe button). Try sending: `D1` and watch LEDs on Arduino. Then send `D0` to see one of the LEDs to turn off. 

## Python

### Connecting to Arduino

When connect your board to the computer using USB cable, it creates a serial port which you will use to communicate with it from Python.

> Arduino IDE uses the same port to upload sketches to the board. Because serial port can be used by one application at once, your upload may fail when you have same port open somewhere else. But no worries, just close it and you’ll be able to upload again.

Depending on your operating system, serial ports have different names. this is why we prepared small programs which list all ports available in your system.

Firstly you have to install some packages which you’ll need in this workshop. Go to *Python* directory from ZIP you’ve downloaded when setting up Arduino. To install requirements type in terminal/command line:

	cd PATH_TO_PYTHON_DIRECTORY_FROM_ZIP
	sudo pip install -r requirements.txt


> What did you just installed? You’ve installed three libraries:
> 
> - PySerial - library for communicating using serial port. Essential in our workshop :)
> - PyAudio - library for handling audio. You’ll use it to play a WAV sound file
> - request - great library for making HTTP requests in easiest manner possible

Great! Now type in terminal:

	python 1_ports.py

This should print a list of available ports like this:

	Available ports:
		/dev/cu.Bluetooth-Serial-1
		/dev/cu.Bluetooth-Serial-2
		/dev/cu.Bluetooth-Modem
		/dev/cu.Bluetooth-PDA-Sync
		/dev/cu.usbmodem1d11421

In this case we’re sure that `/dev/cu.usbmodem1d11421` is our Arduino. If there’s more unknown ports, just check your Arduino IDE which port it’s using (*Tools* -> *Ports menu*). Copy it as you’ll use it in all the following parts.

### Let there be light

Ok, it’s finally time to use Python to control Arduino!
You can start interactive Python shell just by typing `python` in terminal.
Now lets blink some LEDs:

	# Import time module
	import time
	# Import PySerial module
	from serial import Serial
	# Initialize and open serial port
	serial = Serial(‘YOUR_PORT’)
	# Set variable containing current LED status to False
	led_on = False
	# Repeat indefinitely
	while True:
		# Negate LED status
		led_on = not led_on
		# If it should be on...
	        if led_on:
			# ...then send command turning on the LED
       			serial.write("D1")
		# But if it should be off...
		else:
			# ...send the off command
			serial.write("D0")

		# Wait one second
		time.sleep(1)
		
> If this is your first time with Python: you see the indentation? It’s very important in Python. You have to be consistent to use Tab or Spaces in your code.

**BTW:** you should find source to this exercise in `Python/2_blink.py` file.

You can stop this now, pressing `Ctrl+C`.

You’ve just used your code to influence an existing object :)
But this is child's play. Lets try something more advanced.

### Time for some measurements

First thing before writing code is to connect HC-SR04 ultrasonic ranging module with Arduino. Grab your breadboard, some cables and connect them like this:

![Sonar](workshops/pythonruby/3_sonar_bb.jpg)


Colors are not important, but be concise when using them. This way you won’t make silly mistakes like connecting wrong wire to wrong hole.

If everything is connected properly (check it twice) it’s time to go to Python console again and check the value of sensor:

	# Again repeat indefinitely
	while True:
		# “S” command tells Arduino to use sonar
		serial.write("S")
		# Wait on data from serial and store it in variable
		distance = serial.readline()
		# Print this value on screen
		print distance
		# Wait a second
		time.sleep(1)

Now when your code is running, put your hand in front of sensor and observe value on the screen. See it changing? It’s not very accurate but with some tweaks in Arduino code you can make a digital rangefinder!

**BTW:** you should find source to this exercise in `Python/3_sonar.py` file.

Press `Ctrl+C` to stop this code.

### Hot or not

Along our sensors, you have DHT11 which can measure two things: temperature and humidity. Combining it with BH1750 light sensor, you can have a small meteo station, which provides information about current weather outside.

But firstly the wires. Lets start with DHT11 (don’t disconnect the sonar, it will be required later):

![DHT11](workshops/pythonruby/4_meteo_dht_bb.jpg)

Now connect BH1750:

![BH1750](workshops/pythonruby/4_meteo_bh_bb.jpg)

**Important:** connecting BH1750 requires restart of Arduino, so just unplug and plug USB cable again.

It’s Python time:

	# You’ve disconnected Arduino remember? Now you have to open port again
	serial = Serial(‘YOUR_PORT’)
	# Endless loop
	while True:
		# Command for checking temperature
		serial.write("T")
		# Read the temperature
		temperature = serial.readline().strip()
		# You have to wait a little bit to read humidity
		time.sleep(0.5)
		# Humidity command
		serial.write("H")
		# Store the humidity
		humidity = serial.readline().strip()
		# Get light intensity
		serial.write("L")
		# Store it
		light = serial.readline().strip()
		
		# Print values
		print "Temperature: %s°C" % temperature
		print "Humidity: %s%%" % humidity
		print "Light: %slx" % light

		# Wait a second
		time.sleep(0.5)

Yay! You can now remove Weather app from your smartphone.

**BTW:** you should find source to this exercise in `Python/4_meteo.py` file.

### INTRUDER ALERT

You have one sensor left: HC-SR501 PIR motion detector. This sensor detects motion based on infrared light. It’s similar to ones used in public bathrooms to automatically turn on the light. As it works with infrared it only detects objects which exude heat (i.e. human body, running car). What is important, it detects **motion** not presence. So if you’ll hold still in front of it, you won’t be detected.

Other quirk of this sensor is long lag after detecting motion. There’s potentiometer on a back of it which allows to change it, but event with minimal setting it’s about 3 seconds.

Connect the wires like this:

![HC-SR501](workshops/pythonruby/5_alarm_bb.jpg)

Your PIR may have wires with different colors or don’t have wires at all, so just hold it like in the picture above and number pins from left to right.

Supporting code is easy as pie:

	# Use motion sensor
	serial.write("M")
	# After first start, sensor needs about 15 seconds to calibrate, just wait for it
	serial.readline()
	# Loop
	while True:
		# Get the value again
		serial.write("M")
		# Store integer value of the sensor (0 or 1)
		motion = int(serial.readline().strip())
		# If value is 1
		if motion:
			# Alert about suspicious movement!
			print “MOTION DETECTED!”
		# Wait one second
		time.sleep(1)

Now wave in front of the sensor :)
Downloaded sources contain `5_alarm.py` file which is even cooler as it plays a sound! Try it:

	python 5_alarm.py YOUR_PORT

### All in one place

Now you know how to use all the sensors, you can use it to create a beautiful web dashboard with all the data.

To make it easier, we’ve prepared custom dashboard using Dashing: <http://shopify.github.io/dashing/>. It’s super easy to set up and host i.e. on Heroku. Our dashboard looks like this:

![](workshops/pythonruby/dashboard.jpg)

To send data to this dashboard you need to know which ID to use. It should be written on a sticker on your Arduino. If you’re not at Makerland, just use `arduino-X` where X is number from 1 to 20.

Now start Python script which sends data to the dashboard:

	python 6_dashboard.py YOUR_PORT ID

If there’s no error, visit your dashboard at <http://makerland-dashboard.herokuapp.com/ID>

Dig into `6_dashboard.py` to see how to send data to Dashing.

> Code for web dashboard is also in ZIP you’ve downloaded, so feel free to modify it and host wherever you want!

### Sounds of the future

This one you better try with headphones on :) Do you know what Theremin is? It’s a electronic instrument which is controlled without physical contact. Its distinctive sound was often used in older Sci-Fi movies.

Using HC-SR04 ultrasonic ranging module, you can create a poor man’s, almost 8-bit sounding theremin with only pitch control.

Start it using:

	python 7_theremin.py YOUR_PORT

Now holding your hand above sonar, move it closer to it and you should hear change in sound pitch!

> How it works? It’s very hard to explain it here, so take a look into `7_theremin.py` file which is filled with comments explaining how it works.

Unfortunately this was our last exercise, but now you can go to **Additional tasks** section and try to do it just by yourselve!

## Ruby

### Connecting to Arduino
First at all you need to understand how Arduino communicates with your computer. When you plug your board into your computer’s USB port, your operating system will create serial port device.

> Arduino IDE uses the same port to upload sketches to the board. Because serial port can be used by one application at once, your upload may fail when you have same port open somewhere else. But no worries, just close it and you’ll be able to upload again.

Names of serial ports depends on your operating system. You can use our programs to list all serial ports available on your system.

To do so, you have to prepare your environment. Go to *Ruby* directory from ZIP downloaded when you were setting up Arduino. To install required packages type in terminal/command line:

cd PATH_TO_RUBY_DIRECTORY_FROM_ZIP
bundle install

>  What just happened? You have installed two libraries:
>  serialport -  library that will let you communicate using serial port
>  typhoeus  - library for making HTTP calls

Okay! Now type in terminal:
		
		ruby 1_ports.rb

This command should print a list of available serial ports:
	
	Available ports:

		/dev/cu.Bluetooth-Serial-1
		/dev/cu.Bluetooth-Serial-2
		/dev/cu.Bluetooth-Modem
		/dev/cu.Bluetooth-PDA-Sync
		/dev/cu.usbmodem1421

Assuming that you do not have other devices that may create serial ports connected to computer, we’re sure that `/dev/cu.usbmodem1421` is Arduino. If there’s more ports, check the right one in your Arduino IDE by using *Tools*->*Ports menu*.


### Let there be light
Now it’s time to use Ruby to control our Arduino!
You can start by using interactive ruby shell by typing `irb` in your terminal.
Lets blink Arduino built-in LED

	# require serialport library
	require ‘serialport’
	# Initialize and open serial port
	serial = SerialPort.new("YOUR_SERIAL_PORT", 9600, 8, 1)
        # Set variable with LED state to false
        led_on = false
        # Infinitely run this block of code
        loop do
		# negate LED state
		led_on = ! led_on
		# If it should be on...
		if led_on
			# ...then send command turning LED on
			serial.write(“D1”)
			# If it should be off..
		else
			# ...send the off command
			serial.write(“D0”)
		end
	# wait one second for next loop cycle
	sleep(1)

>  In Ruby, other than in Python it is not require to keep indentation, but it is highly recommended due to code readability.

**BTW:** you should find source to this exercise in `Ruby/2_blink.rb` file.

You can stop this now, pressing `Ctrl+C`.

You’ve just used your code to play with something already built, lets get to something more advanced.

### Time for some measurements

Before you write anything lets have fun with wires. Grab HC-SR04 ultrasonic ranging module, Arduino, your breadboard, some wires and connect them all together this way:

![Sonar_rb](workshops/pythonruby/3_sonar_bb.jpg)

You don’t have to use the same colors as we do, but be meticulous while using them. By doing so you will avoid mistakes like connecting ground pin from module to Arduino power pin.

Check two or even three times if everything is set up properly and go back to ruby shell:

		# Lets run it infinitely again
		loop do
			# “S”, as you can see in Arduino code, checks sonar
			serial.write(“S”)
			# Read the data from device and store it in a variable
			distance = serial.readline
			# and print it on the screen
			puts distance
			# then wait a second before the next cycle
			sleep(1)
		end

While your code is running swing your hand in the front of the sensor and observe how value changes on the screen. It might not be very accurate but with some Arduino code tweaks it can get better.

**BTW:** you should find the source to this exercise in `Ruby/3_sonar.rb` file.

Stop your code by pressing `Ctrl+C`


### Hot or not
Among sensors you can find DHT11 which can measure temperature and humidity. Together with BH1750 light sensor you can use them to build small meteo station that could provides information about weather outside.

Start with the wires. Don’t disconnect sonar, it will be required late. First lets connect the DHT11:

![DHT11](workshops/pythonruby/4_meteo_dht_bb.jpg)

Now connect BH1750:

![BH1750](workshops/pythonruby/4_meteo_bh_bb.jpg)

**Important:** connecting BH1750 requires restart of Arduino, so just unplug and plug USB cable again.

Now in Ruby shell:

	# You have reconnected your Arduino, so you have to initialize serial port again
	serial = SerialPort.new("YOUR_SERIAL_PORT", 9600, 8, 1)
	# Loop
	loop do
		# Tell Arduino to check temperature
		serial.write(“T”)
		# Read value from serial and assign to a variable
		temperature = serial.readline.strip
		# Wait a moment to check humidity
		sleep(0.5)
		# Check humidity on Arduino
		serial.write(“H”)
		# Store value in a variable
		humidity  = serial.readline.strip
		# Get a light intensity
		serial.write(“L”)
		# Store it
		light = serial.readline.strip
		
		# Print values
		puts “Temperature: #{temperature} *C”
		puts “Humidity: #{humidity}% “
		puts “Light: #{light}lx “
	
		# Wait a second before the next cycle
		sleep(1)
	end

Now you have your own meteo station, hooray!

**BTW:** you should find source to this exercise in `Python/4_meteo.py` file.
		

### INTRUDER ALERT

There is one sensor left: HC-SR501 PIR motion detector. Based on infrared light, this sensor, similar to those used in public bathrooms to turn the lights on, detects moves. As it works with infrared it only detects objects which exude heat (i.e. human body, running car). What is important, it detects **motion** not presence. So if you’ll hold still in front of it, it won’t detect you

Connect wires this way:

![HC-SR501](workshops/pythonruby/5_alarm_bb.jpg)

Be sure to hold it like on the picture, so you won’t connect it in the wrong way.

Now, the code:

		# Tell Arduino to use motion sensor
		serial.write(“M”)
		# We need  to calibrate sensor first, it takes about 15 seconds
		serial.readline
		# Loop
		loop do
			# We have sensor calibrated, so we can get the data
			serial.write(“M”)
			# and assign it to a variable in integer value (0 or 1)
			motion = (serial.readline.strip).to_i
			# if value is equal 1, then...
			if motion == 1
				# inform us about it
				puts “MOTION DETECTED”
			end
		# wait one second before the next cycle
		sleep(1)
		end

Now swing your hand in front of the sensor.
In downloaded file, `5_alarm.rb` code is more interesting, dig into it!
			

### All in one place
Now you know how to use all the sensors, you can use it to create a beautiful web dashboard with all the data.

To make it easier, we’ve prepared custom dashboard using Dashing: <http://shopify.github.io/dashing/>. It’s super easy to set up and host i.e. on Heroku. Our dashboard looks like this:

![](workshops/pythonruby/dashboard.jpg)

To send data to this dashboard you need to know which ID to use. It should be written on a sticker on your Arduino. If you’re not at Makerland, just use `arduino-X` where X is number from 1 to 20.

Now start Ruby script which sends data to the dashboard:

	ruby 6_dashboard.rb YOUR_PORT ID

If there’s no error, visit your dashboard at <http://makerland-dashboard.herokuapp.com/ID>

Dig into `6_dashboard.rb` to see how to send data to Dashing.

> Code for web dashboard is also in ZIP you’ve downloaded, so feel free to modify it and host wherever you want!

## Additional tasks
- Add new commands to ArduinoSensors sketch, like wait certain period of time or read the state of button (ask us for a button ;))
- Open python interactive shell by typing `python` and play with serial live
-  Play live with serial using ruby

## Additional resources
* <https://github.com/meal/makerland-workshop>
