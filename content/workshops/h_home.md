\newpage

![](content/workshop_images/home.jpg)

\customtitlepage{Hack Your House}

>Have you ever wanted to live in a house like the Jetsons? We will be taking the first step into this inevitable future in our workshop! You will learn to build a system that notifies you immediately of an unexpected environmental change such as gas in the air or a strange loud noise in your house. We will teach you to make your home smarter by using just an Arduino, some awesome analog and digital sensors, and a set of powerful web APIs. 

### Authors

__Jon Gottfried__ has been hacking on hardware since 2005, where he built competitive autonomous firefighting robots with PIC boards. Lately, he has been working on some home automation projects and phone-controlled robots that he is turning into tutorials for Twilio DIY Home Automation using Twilio and Twilio Robot as well as some Google Glass-controlled robots for fun. He loves hacking and loves teaching.

\newpage

# Hack Your House

## Overview

In this workshop you will learn how to build your own smart RFID-controlled deadbolt lock. We will be using an Arduino Uno, a servo, and a few sensors to modify a deadbolt lock so that you can control it via software and unlock it with an RFID tag. You will be able to mount our Arduino to your existing deadbolt without physically modifying or damaging it!

## Preparations

Download the Arduino IDE from <http://arduino.cc/en/Main/Software> and install it on your system.

## Main flow

### Step 1: Hello Robot!

We are going to start off by making sure that you are able to upload code to your Arduino using the Blink tutorial (<http://arduino.cc/en/tutorial/blink>). One of the best things about Arduino is the amazing open source community that exists around it. We will be making use of a number of open source examples as we build our smart lock!

Plug your LED power into pin 13 of your Arduino and ground into the GND pin next to it. The shorter pin is Ground (-) for LEDs. 

![](content/workshops/home/image04.jpg)

Plug your Arduino into your computer via USB.

Open the Arduino IDE, select: *File > Examples > 01.Basics > Blink* and click the *Upload* button to install the Blink program on your board.

If you successfully uploaded your program, the LED that you plugged into your Arduino should be blinking on and off every second!
 
### Step 2: Connect and Test a Servo

Now that we are sure that you can program your Arduino, we will move on to the fun stuff and connect our servo to our board.

A servo is a type of motor that typically has a 180 degree movement radius. Later in the workshop, we will be using our servo to control the movement of a deadbolt lock.

For now, we just want to connect our servo to our Arduino and make sure we are able to control it via a simple program.

A servo motor has three wires - power (red), ground (black), and control (frequently yellow or white). Connect the power wire to the 5V pinout on the Arduino and the ground wire to the GND pinout next to it. We can then connect the control wire to Digital Pin 12 on our Arduino as in the following diagram:

![](content/workshops/home/image02.jpg)

Now that our servo is connected to the Arduino, we will need to write the software to control it. Let’s create a new file and start it off with the following code:

~~~~ {.numberLines}
#include <Servo.h>
Servo myservo;
~~~~~~~

This snippet includes the Servo library and defines a new Servo object that we will use later to control our servo motor.

Next, we can create two methods: `loop()` and `setup()` - these methods are common to every Arduino program. The `setup()` method runs when the Arduino turns on, and the `loop()` method constantly runs on a loop (as the name would suggest).

In our `setup()` method, we will attach our myservo object to pin 10 where we plugged in the servo earlier. The method should look like this when we are done:

~~~~ {.numberLines}
void setup()
{
  myservo.attach(12);
}
~~~~~~~

Now that the Arduino knows where to find our Servo, we can experiment a bit. In order to move the servo to a new position, you use the `myservo.write(pos);` method. pos is an integer from 0 to 180. Try using `myservo.write(pos);` in both the `setup()` and `loop()` methods - see what happens when you set pos to different values. Note that you can use the delay() method to pause execution between different commands.
For example:

~~~~ {.numberLines}
  myservo.write(180);
  delay(1000);
  myservo.write(0);
~~~~~~~

This snippet would move the servo to position 180, pause for 1 second, and then move the servo to position 0.

After each modification, Upload your code to the Arduino again. You can view the progress of your upload in the log console on the bottom of your Arduino IDE.

Once you are comfortable with controlling your Servo, we can move on. Additional examples are available here: <http://arduino.cc/en/Tutorial/Sweep>

### Step 3: Connect and Test RFID Reader

Now that we have programmed our Arduino to control a Servo, we can add our first sensor - the RFID reader. We will be testing using an example sketch from <http://playground.arduino.cc/Learning/PRFID>

The Parallax RFID Reader that we are using is actually fairly simple to program. It has four pins: GND, VCC (power), ENABLE, and SOUT.  The ENABLE pin takes a digital voltage - either high or low. When the voltage is low, the RFID reader is on and actively reading inputs. When it is high, it is deactivated. The SOUT pin is a Serial interface that outputs the RFID tag code as a series of 10 digits.

![](content/workshops/home/image05.jpg)

You will need to wire the GND to your Arduino’s GND, VCC to Arduino’s +5V, ENABLE to Digital Pin 2 on the Arduino, and SOUT to Digital Pin 8 on the Arduino. I like to plug my RFID reader into a breadboard before wiring it to my Arduino, as it makes it easier to prototype.

Once it is wired up, we will be writing a program that uses the Arduino’s SoftwareSerial library to read values from the RFID reader and print them out in our Serial Monitor (a simple tool that the Arduino IDE provides to receive data from the Arduino via a Serial port and display it to you, the developer).

Create a new Sketch (Arduino program) that has a `setup()` and `loop()` method. Then include the SoftwareSerial library at the top of the sketch:

~~~~ {.numberLines}
#include <SoftwareSerial.h>
~~~~~~~

Next we will set up some variables that will be used in our `loop()` method a little later:

~~~~ {.numberLines}
int  val = 0;
char code[10];
int bytesread = 0;
 
#define rxPin 8
#define txPin 9
SoftwareSerial RFID = SoftwareSerial(rxPin,txPin); 
~~~~~~~

An important thing to take note of here are that we are defining our `SoftwareSerial` pins as digital pins 8 and 9, which explains why our RFID Reader’s SOUT is connected to pin 8. We also define the val, code, and bytesread variables. val will store the single digit value read by our RFID reader. code is an array that we will push the digits read by val onto to build the full tag code. And bytesread is a counter to determine how many digits we have read from the RFID reader for an expected tag code, which is 10 digits.

Now we can move on to our `setup()` method. Most of our logic for the RFID reader is going to be in the `loop()` method, so all our `setup()` method needs to do is initiate our Serial monitor and enable our RFID reader by setting digital pin 2 to LOW and opening the 2400-baud SoftwareSerial connection. Add the code from below:

~~~~ {.numberLines}
  Serial.begin(2400);    // Hardware serial for Monitor 2400bps
  pinMode(2,OUTPUT);     // Set pin 2 as OUTPUT to connect it to RFID 
  digitalWrite(2, LOW);  // Activate the RFID reader
  RFID.begin(2400);
~~~~~~~
 
Now we can move on to the meat of our application, the `loop()` - I will explain each block of code line by line, as it is fairly complex the first time you encounter it.

First we need to check the output of the RFID reader:

~~~~ {.numberLines}
  if((val = RFID.read()) == 10)
  {
  } 
~~~~~~~
 
The RFID reader outputs 10 at the beginning of a tag code, and 13 at the end. This lets us know when to stop reading bytes for the current tag code, and move on to the next one.

Within this if statement, we will be running a while loop that reads in 10 digits from the RFID reader:

~~~~ {.numberLines}
  bytesread = 0;
  while(bytesread<10)
  {
  } 
~~~~~~~  
   
The expected length for our tag code is 10 digits, so we only loop until we have read in 10 bytes.

Then we can add the rest of our code within the while loop:

~~~~ {.numberLines}
    val = RFID.read();
    if((val == 10)||(val == 13))
    {  // if header or stop bytes before the 10 digit reading
      break;                       // stop reading
    }
    code[bytesread] = val;         // add the digit          
    bytesread++;                   // ready to read next digit
~~~~~~~  
     
For every iteration of the loop, we read in a single byte outputted by our RFID reader. If that byte is 10 or 13 (our start or stop codes), we break out of our loop. If it is any other value, we add it to the code array and increment bytesread. Last but not least, we need to print our tag code out to the Serial Monitor. After our while loop’s end bracket (but still within our large if statement), we will add the following code:

~~~~ {.numberLines}
    if(bytesread == 10)
    {  // if 10 digit read is complete
      Serial.print("TAG code is: ");   // possibly a good TAG
      Serial.println(code);            // print the TAG code
    }
    bytesread = 0;
    delay(500);                       // wait for half a second
~~~~~~~
   
If we have read in 10 bytes successfully, we print it out in the Serial Monitor and then reset our bytesread counter and wait for half a second to prevent us from looping faster than the RFID reader actually reads values. And that’s it, now you can Upload your code and open the Serial Monitor via the Tools menu. Once you have the Serial Monitor open, make sure to change the baud rate to 2400. Now when you hold an RFID tag near the RFID reader, you should get a tag code outputted to your Serial Monitor!

### Step 4: Turning Our Servo With RFID

Now that we have successfully moved our Servo and read an RFID tag in separate steps, we can try to put it together.

Take the working RFID reader code from Step 3, and attempt to combine it with our working Servo movement code from Step 2.

In order for this to work, we will actually have to connect a separate power supply for our servo to use as the Arduino does not provide enough voltage for both the RFID reader and the servo at the same time.

Take the provided battery, and re-wire the Servo to it. We connect all GND wires to the Arduino’s GND, but the RFID reader’s VCC goes to the Arduino’s +5V output and the Servo’s VCC goes to our external battery pack. This becomes much easier if you experiment with moving the Servo when you print out the Tag Code in our Serial Monitor. Note that since the Servo takes time to move, you may need a larger delay in your RFID reader code.

![](content/workshops/home/image03.jpg)

The Servo library documentation is available here if you would like to dive deeper into it: <http://arduino.cc/en/reference/servo>

If you get stuck, compare your code with the solution here: <https://gist.github.com/jonmarkgo/9058657>

### Step 5: Access Control

Hooray, now you can move a servo whenever someone swipes their RFID tag on our reader! But how do we know if the card being swiped has access to our home? In this step, we will add access control to only allow certain RFID tags to unlock our door.

To find the Tag Code for your RFID tag, open the Arduino IDE Serial Monitor and look for the code that is printed out when you swipe your tag. Copy that code, and put it in a variable in your sketch.

Now, where you currently move the Servo after a tag is detected, add an if statement to check if the tag that was scanned is the verified tag! You may need to use the String library for this comparison: <http://arduino.cc/en/Reference/string>

If you get stuck and would like to compare your code with the solution, you can see it here: <https://gist.github.com/jonmarkgo/9058825>

### Step 6: Mounting to your lock

Now that the software side of our project is done, we must mount the servo to our deadbolt lock. I prefer to use household items when prototyping these types of applications, though if you have access to a 3D printer I would recommend designing and printing your own lock mount.

For the purpose of prototyping, we will be using cardboard and duct tape to mount our servo to our lock - just like astronauts do!

Attach the two metal rods to your servo with screws and washers.

![](content/workshops/home/image00.jpg)

Now use a piece of cardboard (or other stiff material) to make a tighter bond between the servo and the lock:

![](content/workshops/home/image07.jpg) 

![](content/workshops/home/image10.jpg)

Now you can tape the servo to the deadbolt lock. Make sure it is positioned on the correct side so that the direction that the servo turns in is aligned with the direction that the lock turns in:

![](content/workshops/home/image11.jpg)

And last but not least, we will tape our servo’s arms to the deadbolt itself:

![](content/workshops/home/image09.jpg)

Now you have your fully mounted (and fully impermanent) servo-controlled deadbolt:

![](content/workshops/home/image06.jpg)


## Second flow (optional)

At this point, you have built an RFID-controlled deadbolt using your Arduino, a servo, and an RFID reader. But when it comes to home automation, there is always more to be done!

### Experiment 1: Motion-Controlled Deadbolt

This first experiment is the simplest (and most insecure) - we will unlock or lock our door every time we detect movement in front of it.

Take the PIR motion sensor and wire it into your Arduino (VCC to +5V, GND to GND, and control to digital pin 2) - NOTE that the middle wire of the PIR sensor is GND, not the black wire. This is strange, but true. The red (+) wire is still VCC (the sensor should have a + and AL marking on it to distinguish this):

![](content/workshops/home/image08.jpg)

You will need to use an internal pull-up to activate the motion sensor. This is done by setting digital pin 2 as an INPUT pin and then writing a HIGH value to it. Once you Arduino turns on, you need to wait a second or two for the PIR motion sensor to get a reading on a room without movement. Then you can start waving your arms all around!

When motion is detected, lock or unlock your deadbolt.

You can find additional details on the sensor here: <https://www.sparkfun.com/products/8630>

If you get stuck you can find the solution here: <https://gist.github.com/jonmarkgo/9060847>

### Experiment 2: SMS-Activated Deadbolt

For this experiment we only need our Servo connected to our Arduino. Most of the work will be on the Software side.

![](content/workshops/home/image02.jpg)

Once your Arduino is wired up, you need to make sure you have node.js installed and that you have a Twilio account.

You can go to <https://www.twilio.com/> to sign up for a Twilio account. Twilio is an API that makes it easy for us to send and receive text messages or make and receive phone calls. In this case, will be receiving text messages.

You will then need to install node.js from <http://nodejs.org/> and the ngrok utility from <https://ngrok.com/download>

Once you have your Twilio account and you have successfully installed Node.js and ngrok, we can install the necessary modules with the following command in your Terminal:

`npm install serialport twilio express`

Node-Serialport makes it easy to communicate with your Arduino via a Serial connection from a Node.js program. We will be using it to receive HTTP request for incoming text messages from Twilio, and passing instructions along to the Arduino to lock or unlock your deadbolt.

Express is a simple node.js web framework. And the twilio module makes it easy to communicate with the Twilio API.

First things first, we can set up our new Arduino sketch. The sketch is actually fairly simple. All it needs to do is open a 9600-baud Serial connection, attach to your servo (on pin 12), and read in a character from the Serial connection to determine whether or not it should move the servo motor.

I would encourage you to try this on your own by making use of the Servo code from Step 2 (and your experience so far) as well as the Serial library documentation, available here: <http://arduino.cc/en/reference/serial>

I configured my Arduino to lock or unlock my deadbolt whenever it receives the character "V" on it’s Serial port. You can test this functionality by opening the Serial monitor and typing V to see if the servo moves. When the Arduino locks the deadbolt it responds with the "L" character and when it unlocks it responds with "U".

If you run into trouble with this portion of the code, you can see the solution here: <https://gist.github.com/jonmarkgo/9061828>

Now that our Arduino is prepared to receive and send instructions on the Serial port, we can dive into something brand new: a node.js program to control our Arduino!

Create a new file in your editor of choice called nodelock.js and start off the file by requiring the modules that we installed earlier using npm:

~~~~ {.numberLines}
var twilio = require('twilio'),
    serialPort = require("serialport").SerialPort,
    express = require('express');
~~~~~~~

Next we will want to set up our new express server (more documentation available here: <http://expressjs.com/>) and our `serialPort` connection (more documentation available here: <https://github.com/voodootikigod/node-serialport>):

~~~~ {.numberLines}
var app = express();
var serialPort = new SerialPort("/dev/tty.usbmodem1411", {
  baudrate: 9600
});
~~~~~~~

Note that we are specifying which USB port to connect to and the baud rate. You may need to change the value of the USB port on your own computer. You can find the name of your active USB port in the Arduino -> Tools -> Port menu.

Next we will set up our HTTP route, called `/sms`

~~~~ {.numberLines}
app.use(express.bodyParser());
 
app.post('/sms', function(req, res){
});
~~~~~~~

We are telling express to accept POST requests at the `/sms` route, and to parse the POST body using its bodyParser, which will make it easier to access the parameters sent by Twilio’s incoming SMS.

Now that we have our route to accept an incoming SMS, we will want to check if the number the message is from has permission to lock and unlock the door.

~~~~ {.numberLines}
app.post('/sms', function(req, res){
  if (req.body.From == "+12128675309") {
    console.log("verified number!");
  } else {
    console.log("Wrong number!");
    sendMessage(res, "Invalid number!");
  }
});
~~~~~~~

We are checking the From POST parameter and logging whether or not it is verified.

In the block for a verified number, we can now add the handler to send and respond to data from the Arduino’s Serial connection.

~~~~ {.numberLines}
  serialPort.once('data', function(data) {
    if (data.toString().indexOf('U') > -1) { //check if the Arduino returned a U for unlocking
      sendMessage(res, 'Unlocking!');
    }
    else if (data.toString().indexOf('L') > -1) {
      sendMessage(res, 'Locking!');
    }
    else {
      sendMessage(res, 'ERROR');
    }
    console.log('data received: ' + data);
  });

  serialPort.write("V", function(err, results) {
    if (err) {
      console.log('err ' + err);
    }
    console.log('results ' + results);
  });
~~~~~~~
   
This looks fairly meaty, but what is really going on is fairly straightforward. We set up an event handler to receive Serial data from the Arduino. This event handler checks if the Arduino has sent “U” or “L” - we then take this value and return an SMS response to the user using the sendMessage function (which we will write shortly).

After setting up our event handler, we write “V” to the Arduino’s serial connection to tell it that a verified SMS has been received, and it should now lock/unlock the door.

Towards the top of the file we can now create our sendMessage function, which takes two arguments - `res` and `message`:

~~~~ {.numberLines}
function sendMessage(res, message) {
  var resp = new twilio.TwimlResponse();
  resp.message(message);
  res.type('text/xml');
  res.send(resp.toString());
}
~~~~~~~

`sendMessage` is called to generate a TwiML response for the user. TwiML is the subset of XML that Twilio uses to pass around instructions. In this case, we are telling Twilio to respond to the SMS message we have received with another SMS message. So the user might send in “unlock” and we might send back “Unlocking!” via Twilio SMS.

Now that our SMS handler is configured, we can finish up our application by opening our SerialPort and starting up our Express web server:

~~~~ {.numberLines}
serialPort.open( function () {
  app.listen(3000);
  console.log('Listening on port 3000');
});
~~~~~~~

And that’s all of our code. Now, if you Upload the sketch we wrote to your Arduino and run your nodelock.js script by typing node nodelock.js into your Terminal we will be good to go.

If you have run into errors and would like to compare with the solution, you can check it out here: <https://gist.github.com/jonmarkgo/9061701>

To finish things off, we will need to configure Twilio.

Once you have made a new Twilio account (which also provides you with your very own phone number), we can head over to our Twilio dashboard at <https://www.twilio.com/user/account> and click on the Numbers tab. Then click into the number you purchased during account signup.

Here, there are two fields: Voice Request URL and Messaging Request URL. We will be using the Messaging Request URL to tell Twilio where to send data about incoming text messages.

But since Twilio communicates via HTTP requests, we will need a publicly accessible web URL for it to POST to when it receives an SMS to your number. For this, we will be using ngrok - the utility you installed earlier.

Once you have started up your node.js server with `node nodelock.js`, open a new Terminal window and type `./ngrok 3000` from the directory you installed ngrok to. Here you will be given a forwarding URL. Take this forwarding URL, append `/sms` to it, and put it into your Twilio Messaging Request URL in your dashboard. Save your Number’s settings, and try sending an SMS to it! Your lock should lock and unlock as long as you set the verified number to be yours.

Great work and happy hacking!
