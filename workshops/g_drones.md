\newpage
\thispagestyle{empty}
\mbox{}

\newpage

![](workshop_images/drones.jpg)

\customtitlepage{Flying robots}

>In this tutorial you'll learn about the wonderful world of autonomous flying robots, specifically the AR Drone 2.0 provides a high level API to send commands, read data back and stream video from it's HD camera. We'll start writing basic programs to take off and land, and before you know it you'll be using feedback from a wealth of onboard sensors to perform more impressive maneuvers and behaviours. 

### Authors

__Andrew Nesbitt__ is a passionate full stack developer. He spends most of his days programming in Ruby, playing with Node.js, contributing to open source projects and organising local developer user groups. He also aspires to one day take over the world with a fleet of JavaScript powered quadcopters.

__Felix Geisendörfer__ is a programmer and entrepreneur currently living in Berlin, Germany. He was one of the first core-contributors of node.js, co-founded [transloadit.com](http://transloadit.com/), and started the [nodecopter.com](http://nodecopter.com/) movement with some of his friends. His favourite programming language is Go at this point.

__Robin Mehner__ is a freelance developer & consultant living in Berlin. He has a strong affection for robots and the web. He keeps himself busy teaching to code, organizing conferences and running meetups. Together with a few friends he started NodeCopter and is now on a mission to spread the flying robot love.

\newpage

# Flying robots

## Overview

In this workshop you'll learn about the wonderful world of autonomous flying robots, specifically the AR Drone 2.0 provides a high level API to send commands, read data back and stream video from it's HD camera.

We'll start writing basic programs to take off and land, and before you know it you'll be using feedback from a wealth of onboard sensors to perform more impressive maneuvers and behaviours.

## Preparations

First, if you’ve not already played with an AR Drone before then download the FreeFlight app for your iOS or Android device and take one of the drones for a flight:

* Plug in the battery of your drone <https://www.youtube.com/watch?v=QdFsd9R3vJ8#t=25s> 
* Connect your device to the wifi labeled on the drone, i.e. D1
* Open the FreeFlight app and tap “Piloting”
* Hit "Takeoff" and enjoy flying your robot around the room

Now that you’ve got the hang of how to fly your robot around, let’s get setup for controlling them programmatically with JavaScript

* Install Node.js on your computer: <http://nodejs.org/download/>
* Create a folder to work in (something like *nodecopter*)
* Install the ar-drone npm module with `npm install ar-drone` within the folder

## Main flow

Now connect to the drone's WiFi with your smartphone, start the FreeFlight app and make a test flight with it's Piloting feature to learn how the drone behaves.

Once you've done that, save this to a file called `flight.js`:

~~~~ {.numberLines}
var arDrone = require('ar-drone');
var client = arDrone.createClient();

client.takeoff();

client
  .after(5000, function() {
    this.clockwise(0.5);
  })
  .after(3000, function() {
    this.counterClockwise(1);
  })
  .after(1000, function() {
    this.stop();
    this.land();
  });
~~~~~~~

and run it with `node flight.js`. See how your drone takes of, rotates clockwise and then back again! Amazing. Now let’s try customising your script with different commands:

Basic directional commands:

- `client.takeoff()`
- `client.land()`
- `client.up(speed)`
- `client.down(speed)`
- `client.clockwise(speed)`
- `client.counterClockwise(speed)`
- `client.front(speed)`
- `client.back(speed)`
- `client.left(speed)`
- `client.right(speed)`
- `client.stop()`

Where `speed` is a value between 0 (stopped) and 1 (full speed).

Animation options:

- `phiM30Deg`
- `phi30Deg`
- `thetaM30Deg`
- `theta30Deg`
- …

> More details for the API can be found in the readme: <https://github.com/felixge/node-ar-drone#ar-drone>

Combine these together and get your drone dancing around the room!

Now that you’ve got the hang of the basics, there are three different challenges to attempt, you can try them in any order.

## Make your own drone controller

Wouldn’t it be cool if we could control the drone from the keyboard on your laptop, like playing a real life computer game!? Let’s see how we can do that next.

First off we’ll need to listen for key presses, we can do that with the *keypress* (<https://github.com/TooTallNate/keypress/>) node module, we can install that with:

`npm install keypress`

The example from the Readme (<https://github.com/TooTallNate/keypress#readme>) shows how to listen for keypress events in the terminal and then react to them:

~~~~ {.numberLines}
var keypress = require('keypress');

// make `process.stdin` begin emitting "keypress" events
keypress(process.stdin);

// listen for the "keypress" event
process.stdin.on('keypress', function (ch, key) {
  console.log('got "keypress"', key);
  if (key && key.ctrl && key.name == 'c') {
    process.stdin.pause();
  }
});

process.stdin.setRawMode(true);
process.stdin.resume();
~~~~~~~

Let’s combine that with some of the ar-drone code we wrote before to get the drone to take off when *spacebar* is pressed and land when *L* is pressed:

~~~~ {.numberLines}
var keypress = require('keypress');
var arDrone = require('ar-drone');

var client = arDrone.createClient();

keypress(process.stdin);

process.stdin.on('keypress', function (ch, key) {

  if (key && key.name == 'space') {
    console.log('Takeoff!');
    client.takeoff();
  }

  if (key && key.name == 'l') {
    console.log('Land!');
    client.stop(); // stop moving before landing
    client.land();
  }

  if (key && key.ctrl && key.name == 'c') {
    console.log('Quitting')
    process.stdin.pause();

    // Land the drone incase it's flying
    client.stop();
    client.land();

    // close the connection to the drone
    // stops your process hanging
    client._udpControl.close();
  }

});

process.stdin.setRawMode(true);
process.stdin.resume();
~~~~~~~

Copy that code into a file called `keyboard.js`, make sure you’re connected to the drones wifi and run the code from the terminal:

`node keyboard.js`

Then you can hit the spacebar and your drone should take off, then press the L button to land it, congratulations!

Before we start adding more keys and commands, why don’t we refactor this code a little to make it easier to add new commands:

~~~~ {.numberLines}
ar keypress = require('keypress');
var arDrone = require('ar-drone');

var client = arDrone.createClient();

keypress(process.stdin);

var keys = {
  'space': function(){
    console.log('Takeoff!');
    client.takeoff();
  },
  'l': function(){
    console.log('Land!');
    client.stop();
    client.land();
  }
}

var quit = function(){
  console.log('Quitting');
  process.stdin.pause();

  client.stop();
  client.land();
  client._udpControl.close();
}

process.stdin.on('keypress', function (ch, key) {
  if(key && keys[key.name]){ keys[key.name](); }
  if(key && key.ctrl && key.name == 'c') { quit(); }
});

process.stdin.setRawMode(true);
process.stdin.resume();
~~~~~~~

Now we can easily add more commands to the `keys` object, using the name of the keyboard key, for example, see how we’ve added the *up arrow* key option:

~~~~ {.numberLines}
keys = {
  'space': function(){
    console.log('Takeoff!');
    client.takeoff();
  },
  'l': function(){
    console.log('Land!');
    client.stop();
    client.land();
  },
  'up': function(){
    client.up(0.5);
  }
}
~~~~~~~

Why not try adding some more commands from the initial tutorial, mapping them to keyboard keys and try it out by flying your drone around the room, maybe even use the key layout from your favourite flight sim game? WASD and arrow keys work great for me.

Now that you’ve got the hang out that, you could replace your keyboard controller with something else, like an Xbox Controller (<https://github.com/andrew/node-xbox-controller>) or even an Arduino (<https://github.com/rwaldron/johnny-five>) and build your own drone controller from scratch.

## Reading data from the Drone

As well as sending commands to the drone (takeoff, turn left, do a flip! etc), you can also get data back from the drone to find out what’s going on onboard, let’s see how to we can do that.

First let’s output a stream of raw data directly from drone, add the following code to a file called `navdata.js`:

~~~~ {.numberLines}
var arDrone = require('ar-drone');
var client = arDrone.createClient();

client.on('navdata', function(data){
  console.log(data);
});
~~~~~~~

Connect to your drones wifi and then run the code with: 

`node navdata.js`

You should see huge amounts of pure drone data streaming down your terminal looking something like this:

~~~~ {.numberLines}
{ header: 1432778632,
  droneState:
   { flying: 0,
     videoEnabled: 0,
     visionEnabled: 0,
     controlAlgorithm: 0,
     altitudeControlAlgorithm: 1,
     startButtonState: 0,
     controlCommandAck: 1,
     cameraReady: 1,
     travellingEnabled: 0,
     … },
  sequenceNumber: 300711,
  visionFlag: 1,
  demo:
   { controlState: 'CTRL_LANDED',
     flyState: 'FLYING_OK',
     batteryPercentage: 50,
     rotation:
      { frontBack: 2.974,
        pitch: 2.974,
        … },
     frontBackDegrees: 2.974,
     … },
  }
}
~~~~~~~

Every time the drone send some information to you, the *navdata* event is fired, and our callback recieved a “data” object. There’s all kinds of information stored inside this object, things like how much battery life is left, the position of the drone in 3D space (pitch, yaw and roll etc), altitude and error messages to name a few.

With this data we can start to make our drones truly autonomous, using their sensor data to provide feedback and change direction based on the environment or the drones position, one fun task to try would be to try and get your drone to hover exactly 2.5 meters above the ground.

You can use the *altitude* section within the navdata to read what the current height of the drone is, and if it’s lower than 2.5 meters, then tell it to fly up, and if it’s higher then move downwards until it reaches the correct height.

Another neat use of the navdata to create a dashboard or visual display in a web browser, but first we need to send the data from our node.js process up to a browser, the perfect excuse to play around with some WebSockets.

First lets install socket.io (<http://socket.io/>), a node module that makes it really easy to work with web sockets, and express (<http://expressjs.com/>), another node module that makes serving web pages from a node.js process nice and simple. Just run:

`npm install socket.io express`

Now let’s use the example socket.io code (<http://socket.io/#how-to-use>) with our nodecopter navdata code, first lets add the server to a file called `app.js`:

~~~~ {.numberLines}
var app = require('express')()
  , server = require('http').createServer(app)
  , io = require('socket.io').listen(server)
  , arDrone = require('ar-drone')
  , client = arDrone.createClient();

server.listen(8080);

app.get('/', function (req, res) {
  res.sendfile(__dirname + '/index.html');
});

io.sockets.on('connection', function (socket) {
  client.on('navdata', function(data){
    socket.emit('navdata', data);
  });
});
~~~~~~~

Then for our web page, add the following code to a file called `index.html`:

~~~~ {.numberLines}
<!DOCTYPE html>
<html>
<head>
<title>Nodecopter!</title>

<script src="/socket.io/socket.io.js"></script>
<script>
  var socket = io.connect('http://localhost:8080');
  socket.on('navdata', function (data) {
    console.log(data);
  });
</script>

</head>
<body>
  Let's fly!
</body>
</html>
~~~~~~~

Make sure you are connected to the drone’s wifi and start up the server with:

`node app.js`

And point your browser to <http://localhost:8080>, you should see *"Let’s fly"* and if you open up the javascript console in the developer tools section of your browser, you should see the navdata being sent to the browser via socket.io. 

Now we have data that we can use to display what is happening inside the drone, for example, here’s an updated version of `index.html` that shows how to display the current percentage of battery life left:

~~~~ {.numberLines}
<!DOCTYPE html>
<html>
<head>
<title>Nodecopter!</title>

<script src="/socket.io/socket.io.js"></script>
<script>
  var socket = io.connect('http://localhost:8080');
  socket.on('navdata', function (data) {
    document.getElementById("battery").innerHTML = data.demo.batteryPercentage;
  });
</script>

</head>
<body>
  <h1>Let's fly!</h1>
  Battery: <span id="battery"></span>%
</body>
</html>
~~~~~~~

That’s quite a simple example but it’s a good starting point. Here’s some ideas of ways you could extend this:

* Show any error messages received from the drone (when it has crashed or having communication issues for example),
* Visualise the position and direction of the drone with css 3D transforms (<http://desandro.github.io/3dtransforms/docs/introduction.html>),
* You could even send messages back to the server from the browser over the web socket connection to send commands to the drone from the browser.

If you are feeling adventurous you can also ask the drone to send ever more data, more often as well, by disabling it’s `demo` flag with this extra line of code:

`client.config('general:navdata_demo', 'FALSE');`

## Additional tasks

Try out some of these more advanced nodecopter projects:

* AR Drone Autonomy (<https://github.com/eschnou/ardrone-autonomy>) - Instead of directly controlling the drone speed, you can use Autonomy to plan and execute missions by describing the path, altitude and orientation the drone must follow.

    ~~~~ {.numberLines}
    var autonomy = require('ardrone-autonomy');
    var mission  = autonomy.createMission();

    mission.takeoff()
           .zero()       // Sets the current state as the reference
           .altitude(1)  // Climb to altitude = 1 meter
           .forward(2)   
           .right(2)     
           .backward(2) 
           .left(2)
           .hover(1000)  // Hover in place for 1 second
           .land();

    mission.run(function (err, result) {
        if (err) {
            console.trace("Oops, something bad happened: %s", err.message);
            mission.client().stop();
            mission.client().land();
        } else {
            console.log("Mission success!");
            process.exit(0);
        }
    });
    ~~~~~~~

* The AR Drone comes with two different cameras, a HD one on the front, and a downward facing camera as well. There are couple of open source projects that allow you to actually stream these video streams from the drone and up to a browser so you can see what the drone sees from your laptop:

    * <https://github.com/bkw/node-dronestream>
    * <https://github.com/Soarez/ar-drone-png-stream>

* Build your own webflight plugin (<https://github.com/eschnou/ardrone-webflight>) - Webflight is a really neat project that provides a browser based controller for the AR Drone, and best of all it’s got a great plugin architecture, including plugins for: 
    * video streaming,
    * heads up display, 
    * controlling via keyboard or gamepad
    * even visualising air traffic control data

    Why not try and build your own plugin to add some new functionality to the project?

* Check out some of the other Nodecopter projects on GitHub and maybe send a pull request to one of them? <https://github.com/search?q=nodecopter>


## FAQ

* __Help! I crashed my drone!__
 
    Don’t worry, crashes will happen and the AR Drones are fairly rugged and easy to repair if they do break. Try not to fly the drones too close to other people or drones, in a big open space to avoid collisions and triple check your code before you do a test flight!

* __My drone won’t take off__

    The most likely reason your drone won’t take off is because the battery is flat, swap it out with a freshly charged one. If it’s still not working try connecting to it using one of the official mobile apps as they often show more error messages, it could be that something is broken and needs repairing.


* __Where do I get the mobile app from?__

    You can get the mobile app for iOS from the App Store, it’s called *FreeFlight* and for Android the app is on Google Play and is called *AR.FreeFlight*, both are free.

* __How much can an AR Drone lift?__

    Not much, about 100g before it becomes unstable, just about enough for an Arduino.

* __What other programming languages can be used?__

    You don’t use have to use Node.js for controlling AR Drones, there are libraries in lots of other languages, here are a few we know of:

    * Ruby: <https://github.com/jimweirich/argus>
    * Python: <https://github.com/venthur/python-ardrone>
    * Go: <https://github.com/felixge/go-ardrone>
    * Clojure: <https://github.com/gigasquid/clj-drone>
    * C#: <https://github.com/Ruslan-B/AR.Drone>
    * Java: <https://github.com/MahatmaX/YADrone>
    * PHP: <https://github.com/jolicode/php-ar-drone>

## Additional resources

- Nodecopter website - <http://nodecopter.com/hack>
- Nodecopter modules on NPM - <https://npmjs.org/browse/keyword/nodecopter>
- AR Drone SDK documentation: <https://projects.ardrone.org/projects/show/ardrone-api>
