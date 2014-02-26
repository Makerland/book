\newpage
\thispagestyle{empty}
\mbox{}

\newpage

![](workshop_images/underwater.jpg)

# Dive! Dive! Dive! 

>Ever dreamt about having a mechanical fish or your own submarine? Now it's possible! Build a basic autonomous underwater robot, powered by a small electric motor, that's capable of navigating around a small paddling pool. Infrared sensors are used to provide inputs to an Arduino Nano development board which acts as the brain and controls a couple of servo's linked to a rudder and a dive plane to navigate the robot in the water. 

### Authors

__Martin Evans__ lives in the North East of Scotland.Lead author of “Arduino in Action” which was published by Manning Publications in June 2013 and is currently being translated into Portuguese, Polish, Simplified and Complex Chinese. Martin is passionate about robotics and Underwater remote operated vehicles. He has exhibited his underwater vehicles at numerous Maker Faires throughout the UK and Southern Ireland as well as presenting at the Scottish Ruby Conference. He currently runs a Code Club at his local primary School and is assisting a nearby secondary school with their entry to this years Mate underwater ROV competition.

\newpage

# Dive! Dive! Dive! 

## Introduction

In this workshop we are going to build an AUV, the main body is a Lock & Lock container normally usually used for keeping food in. Propulsion to drive our vehicle will be provided by a submarine motor capable of being submerged to  shallow depths. An Arduino Nano will control navigation. Dive planes will be used to regulate depth and a rudder for turning. Infrared sensors will act as the eyes of the AUV and will be used for obstacle avoidance and bottom of the pool detection.

## Requirements

![](workshops/underwater/1.jpg)

- 1 x 1litre Lock & lock container pre drilled
- 1 x Arduino Nano V3.0
- 2 x Micro servo motors with horns
- 3 x Micro rudder assemblies
- 1 x submarine motor
- 1 x 400 breadboard
- Selection Male to Male jumper leads
- 1 x IDE header 9 pins
- 2 x Large paper clips
- 3 x Plastic spacers
- 2 x Vishay IR LED’s TSAL6400
- 1 x Vishay IR detector TSOP4838
- 1 x Sharp GP2D12 distance sensor with connector
- 1 x thin rod 2mm diameter
- 1 x Battery pack holder 4AA batteries
- Bags of coins for ballast

### Consumables

- Silicon sealant
- Coloured wires 0.7mm single strand
- Heat shrink
- Plasticine
- Double sided tape
- AA batteries (5 per AUV)

### Tools / Equipment

- Laptops with Arduino IDE installed
- Mini-USB cables to load sketches onto Arduino Nano
- Servo motor tester
- Small flat screw driver
- Snips 
- Wire strippers
- 13mm Spanner
- Multimeter

## Main flow

The main body of the AUV is going to use a Lock & Lock container normally used for storing food. It has a built in seal and is both airtight and watertight. Three holes have been pre-drilled into the container for installation of the dive planes and rudder. The dive planes allow the AUV to submerge very much like the fins on a shark and the rudder controls the direction of travel. 

Lets get started by assembling the servo motors, dive planes and rudder this will also provide us with our first opportunity to test how waterproof our system is.

### Assembling Servo motors, dive planes and rudder

1. Assemble dive planes / rudder into container with provided spacers, washers and 13mm nuts. Take care not to over tighten the nut as this will distort the O-ring and be a possible point of water entry.
2. At this stage it is important to test for leaks. Place the lid on the container and gently lower the complete assembly into the pool. Check carefully for any leaks of water. If leaks are found they can be cured by injecting a small amount of silicone sealant into the end of the rudder shafts. After adding any silicone sealant repeat the test for water tightness. Keep testing until you have a watertight container.

![](workshops/underwater/2.jpg)

3. Attach the dive plane horns to the dive plane shafts.
4. Line up the dive planes parallel to the bottom of the AUV.
5. Centre servo body and stick down with double sided tape.
6. Centre servo at 90 degrees using provided servo motor tester.
7. Attach horn to servo, see picture below for orientation.
8. Add link between servo and dive planes using a paperclip.
9. Tighten screws on dive planes.
10. Connect dive planes together with short metal rod.

![](workshops/underwater/3.jpg)

11. Test movement of dive planes using servo motor tester.
12. Install rudder into AUV body using spacer, washer and nut.
13. Attach rudder horn to rudder shaft.
14. Centre servo at 90 degrees using servo tester.
15. Fit servo horn to servo, see picture below for orientation.
16. Add link between servo and rudder assembly using paperclip.

![](workshops/underwater/4.jpg)

17. Test rudder assembly using servo tester.

Now that we have the mechanical components assembled we can move onto adding the electronics components. Starting with two IR LED’s and IR receiver. These are used by the AUV for obstacle avoidance. Each IR LED is switched on and off alternately by the Arduino Nano at a frequency of 38khz, the same as used in a television remote control. The IR receiver can detect infrared light at a frequency of 38khz so will detect any light reflected back from an obstacle in the path of the AUV. The Arduino sketch recognises which LED is switched ‘on’ so can take action to avoid the obstacle.

### Connecting IR LED’s and Receiver

1. Place breadboard with the Arduino Nano installed at the front of the AUV
2. Connect IR LED’s and IR receiver to the breadboard. See picture below and circuit diagram.

![](workshops/underwater/5.jpg)

3. Connect the two servos to the breadboard using the piece of IDE header

We are next going to add a sensor to detect when the AUV is near the bottom of the pool. We are going to use infrared again but as we want a more accurate measurement we are going to use a Sharp GP2D12 distance sensor, the sensor can accurately measure distances between 10 and 80 cm. 

### Connecting up the Sharp GP2D12

Connect the sharp GP2D12 sensor to the breadboard using the remaining three pins on the IDE header and use the male jumpers to connect to the Arduino Nano. Use the circuit diagram from below for reference. With the distance sensor wired up we can now move onto fixing the IR LED’s, IR receiver and the Sharp GP2D12 to the box for this we are going to use plasticine which is readily mouldable but adheres nicely to the plastic.

![](workshops/underwater/6.jpg)

### AUV Schematic

![](workshops/underwater/7.jpg)

### Attaching the IR Sensors

1. Take a small piece of plasticine and mould it round the lens of each LED leaving a hole at the front then press onto the plastic container.
2. Do the same for the IR receiver

![](workshops/underwater/8.jpg)

3. Similarly attach the Sharp GP2D12 to the bottom of the AUV 

![](workshops/underwater/10.jpg)

The last thing we need to add to the inside of the AUV is the battery pack this connects to the Vin and GND of the Arduino Nano.

### Installing the battery pack

1. Install the battery pack into the AUV. 
2. The battery pack provides 6V and connects to the Vin and GND of the Arduino Nano.

We now need to check the operation of the servo motors and sensors. 

### Testing

1. Use your hand as an obstacle place it in front of the forward facing IR sensors and check that the rudder moves appropriately
2. Place your hand underneath the AUV and note that the dive planes should move in relation to how far your hand is away.
3. If the servos don’t move as expected then check all your wiring and repeat the tests until every thing is working.
4. When everything is working disconnect the battery pack and proceed to the next stage

That completes the internal electronic and mechanical components of the AUV. We want to make a quick check that everything is still watertight. Pop on the lid of the AUV and gently submerge it into the pool do a visual check for leaks and then take it out and dry it.

To make the AUV move through the water we are going to use a submarine motor as used on a toy submarine. The motor sticks on the bottom of the AUV using a suction cap and is powered by its own internal AA battery.

### Propulsion

1. Attach the rubber suction cap to the submarine motor.
2. Stick it to the bottom of the AUV lining up the propeller with the rudder.

![](workshops/underwater/11.jpg)

That is the main parts of the AUV completed but if you place it into the pool you will notice it is nicely buoyant and will float quite happily on top of the water. We want a vehicle that can go underwater so we need to add ballast to make it very slightly positively buoyant. 

### Adding ballast

1. Add small bags of coins to the bottom of the inside of the AUV
2. Make sure the coin bags won’t impede any of the movements of the rudder or dive planes.
3. Try to keep the weight spread out so when the AUV is in the water it will be level.
4. After adding some weight try putting the AUV into the pool and see how buoyant it is.
5. Keep repeating adding or subtracting weight until the AUV is just positively buoyant and nicely trimmed in the pool

You can tell when the AUV is just positively buoyant by giving it a gentle push on the top with your finger; the AUV should sink a little way and then slowly float back to the surface.

That completes the build process it’s now time to try the AUV on its maiden voyage.

### Maiden voyage

1. Connect internal battery pack to the breadboard
2. Check everything is working properly
3. Switch on submarine motor
4. Place into the pool and let go.

Congratulations you have built your underwater AUV, it should be moving around the pool avoiding obstacles and slowly moving up and down in the water.

## Aditional resources

1. How to use infrared receiver sensors for collision avoidance <http://letsmakerobots.com/node/29634>
2. Arduino <http://arduino.cc>
3. Fritzing <http://fritzing.org>
