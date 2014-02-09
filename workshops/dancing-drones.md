# Dancing Drones

## Overview
In this workshop you'll learn about the wonderful world of autonomous flying robots, specifically the AR Drone 2.0 provides a high level API to send commands, read data back and stream video from it's HD camera.

We'll start writing basic programs to take off and land, and before you know it you'll be using feedback from a wealth of onboard sensors to perform more impressive maneuvers and behaviours.

## Preparations

- Insert a fully charged battery into the AR Drone: <https://www.youtube.com/watch?v=QdFsd9R3vJ8>
- Download the FreeFlight app for your iOS or Android device.
- Create a folder to work in (something like ``nodecopter``)
- *Optional*: Install Node.js on your computer: <http://nodejs.org/download/>
- *Optional*: Install the ar-drone npm module with `npm install ar-drone` into the folder

## Main flow

Now connect to the drone's WiFi with your smartphone, start the FreeFlight app and make a test flight with it's Piloting feature to learn how the drone behaves.

Once you've done that, save this to a file and execute it:

~~~~ {.numberLines}
var arDrone = require('ar-drone');
var client = arDrone.createClient();

client.takeoff();

client
  .after(5000, function() {
    this.clockwise(0.5);
  })
  .after(3000, function() {
    this.animate('flipLeft', 15);
  })
  .after(1000, function() {
    this.stop();
    this.land();
  });
~~~~~~~

See how your drone takes of, rotates clockwise and even does a flip! Amazing. Now let’s try customising your script with different commands:

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
 sending commands from a controller (xbox, keyboard, arduino, browser)

## Second flow
reading nav data from the drone and visualising it (in a browser, or terminal)

## Eye in the sky
streaming video/png data back and displaying it (most likely in a browser)

## Additional tasks
Additional tasks to be filled here. For those who want more or are more advanced if you don't have second flow.

## FAQ

- Crashes
- Won’t take off
- The App
- How much can an AR Drone lift? - Not much, about 100g before it becomes unstable.

## Additional resources

- Nodecopter website - <http://nodecopter.com/hack>
- Nodecopter modules on NPM - <https://npmjs.org/browse/keyword/nodecopter>
- Nodecopter projects on GitHub - <https://github.com/search?q=nodecopter>

