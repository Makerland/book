# Dancebot: The Dancing Robot

## Overview

In this chapter we're going to assemble a small, humanoid robot designed to dance. The moving parts of the robot are called "Bitbeam". Bitbeam is LEGO Technic-compatible, but made with a 3D printer. 3D printing is a beginner-friendly, low-cost, open-source alternative for creating mechanical robot parts.Dancebot will have the following features:

- Swivel head side to side. 
- Rotate each arm up and down. 
- Bust a move.

![](workshops/dancebot/image001.png) 

## Preparations

To build a Dancebot, you'll need:

__Electronics:__

- 1 Arduino UNO
- 1 Arduino Sensor Shield V4
- 3 HiTec HS-311 servos
- 1 servo horn (Red, X-shaped) 
- 2 servo horns (White, straight) 
- 6 servo horn mounting screws

__Printed parts:__

- 1 Dancebot head- 2 Bitbeam Arduino mounting plate 
- 4 Bitbeam servo mounts
- 2 Bitbeam servo arms
- 13 Bitbeam 1x9 beam

__Nuts and bolts:__

- 8 x 3/4-inch 10-32 bolts 
- 10 x 1-inch 10-32 bolts
- 4 x 1 1/2-inch 10-32 bolts 
- 8 x 6-32 bolts
- 2 x 1/2 inch 4-40 bolts 
- 22 x 10-32 nuts
- 8 x 6-32 nuts
- 2 x 4-40 nuts

__Assembly tools:__

- 1 x 7/32 hex driver- 1 x 3/32 hex driver- 1 x 5/32 hex driver- 1 x Phillips #1 screwdriver


![](workshops/dancebot/image002.png)

#


## Let's build a Dancebot!

### First arm

Parts you need to build first arm:

![](workshops/dancebot/image003.png) 


Use 6-32 nuts and bolts to attach 2 Bitbeam servo mounts to the servo. After that, use 1-inch 10-32 nuts and bolts to attach 1x9 Bitbeam beams to Bitbeam servo mount.


![](workshops/dancebot/image004.png) \ ![](workshops/dancebot/image005.png) 

## Arm number two

Let's move on onto the next arm. You'll use the same parts you used for the first arm. Use 6-32 nuts and bolts to attach 2 Bitbeam servo mounts to the servo. After that, use 1-inch 10-32 nuts and bolts to attach 1x9 Bitbeam beams to Bitbeam servo mount.

![](workshops/dancebot/image004.png) \ ![](workshops/dancebot/image006.png) 


Two arms of Dancebot should look like that:

![](workshops/dancebot/image007.png) 


## Chest and Neck

Parts you will need for this: 

![](workshops/dancebot/image008.png) 

Attach the red, x-shaped servo horn to the 1x9 Bitbeam beam with 2 servo mounting screws. Then attach Arm 1 and one 1x9 Bitbeam beam to the Arduino mounting plate using a 3/4. The last step is to attach Arm 2 to the Arduino mounting plate.

![](workshops/dancebot/image009.png) \ ![](workshops/dancebot/image010.png) \ ![](workshops/dancebot/image011.png)

## {TODO: Fill-in remaining steps}

![Dancebot - Fully assembled](workshops/dancebot/image012.png) 

## Teaching Dancebot to dance:

- Install StandardFirmata on Arduino
- Checkout Dancebot source
- Use `npm install` to install dependencies.
- Run `node dancebot.js` to launch the Dancebot REPL.
- Enter `dance()` to make the robot start dancing
- Enter `chill()` to make the robot stop dancing and chill-out.

## FAQ

__Will I learn to design 3D printable parts in this workshop?__

No. This workshop does not show you to design your own 3D printable parts.


__How do I 3D print my own robot parts?__
If you don't have a 3D printer, you have several options. You can visit a hackerspace like TechShop in your area that has a 3D printer you can use if you're a dues paying member. You can also use an online printing service such as Ponoko or Shapeways. Online services are perhaps the easiest way to obtain the parts for your own Dancebot, but they are also the slowest and most expensive. Your best option is to either get your own printer, or become friends with someone who does!
