\newpage

![](workshop_images/soldering.jpg)

# Soldier, wire, glue!

>Thoughts about using a tool that melt metal can be a little scary, right? Not anymore! After this tutorial, soldering things will become your new hobby, we promise. You'll learn all different techniques of building and making things stick. Our workshop leaders will make sure nothing goes wrong and after a half an hour, you won't believe you didn't touch soldering iron before.

### Authors

> lack of bio

\newpage

# Soldier, wire, glue!

![](workshops/soldering/17.jpg)

## Overview

Imagine your Arduino or RaspberryPi.  Imagine you are building your dream project and there comes a moment when you have to compromise with the device's functionalities because you have run out of ports in the microcontroller.

During this workshop you'll solve your problem. Your task will be to create a board with a MCP23017 port expander.

You'll think: a yet another breadboard and plenty of tangled wires. Far from it. During the next hour you'll create something lasting. You'll solder the expander and other elements onto the universal PCB board. And maybe you'll create a completely new shield for the Arduino Uno?


## Preparations

![](workshops/soldering/1.jpg)

In order to be able to focus on your work, you should prepare your workspace. You need:

- a soldering iron
- solder
- side cutters
- handles
- a small bottle of spirit + a cloth
- a universal board (PCB)
- a MCP23017 port expander and other elements that your imagination dictates (LEDs, buttons etc).
- the MCP23017 Datasheet


## Main flow

Your task is to create a port expander for the Arduino Uno. 

The expander has 16 I/O ports. Add LEDs and buttons to 8 of them. You will be able to read the states of the buttons and control the LEDs through the Arduino Uno, which will communicate with the expander through the I2C bus.

You should solder all the elements onto the PCB.

### Plan your work

![](workshops/soldering/2.jpg)

If you don't know MCP23017, you must get acquainted with the datasheet. You'll learn from it about the capabilities of the circuit and the distribution of pins.

Knowing the distribution of pins and the way of communicating with the expander, you should plan the arrangement of components: the expander, the connectors, LEDs and buttons.

If you want to make a shield for the Arduino Uno, you must think of how to deploy the connectors by which you will connect your shield with the Arduino (go to **Additional Tasks**).

### Preparation for soldering

![](workshops/soldering/11.jpg)

Put the first elements into the board. You should solder the elements from below. The most frequent mistake at this stage is to put in too many elements, which are going to fall out of the board when you turn it upside down for soldering.

### Soldering

Solder the following way:

- apply the hot tip of the soldering iron to the leg of the element and the pad on the PCB
- heat this spot up for about 3 seconds
- quickly apply solder and flux to the soldered elements. Don't apply solder directly to the iron!

![](workshops/soldering/4.jpg) \ ![](workshops/soldering/6.jpg)


- solder melts, flux removes oxides from metal surfaces, the elements are joined together with a joint
- withdraw the iron and solder
- solder solidifies to form a firm joint of the elements

![](workshops/soldering/7.jpg) \ ![](workshops/soldering/8.jpg)

- cut the ends of long legs (LEDs) right at the joint


### Tips & tricks

1. A well made solder should be shiny and have a nice shape. Holes in the joint or a matte color are signs of a poorly made soldering. The elements were probably dirty (dust or glue) or greasy. Before you start soldering, it's a good idea to clean the elements with a spirit-soaked cloth.

![](workshops/soldering/13.jpg)

2. Not to overheat the components, try not to heat the legs of the elements up for too long. You'll come up with an optimum time as you practice.

3. Clothing from artificial fabrics electrifies us. An electric charge accumulates on the surface of our bodies. It might even be a few kilovolts relative to the ground. If you touch an element (the expander or a LED) while electrified, there will be an electrostatic discharge and you will damage it. In order to prevent this, wear an antistatic wristband during soldering. If this is not possible, touch a grounded piece in your hereabouts (e.g. the railing of the stairs) before you start.

4. Flux contained in the solder is designed to remove oxides from the surface of the soldered metal. Oxides are formed through the reaction of metal with air. They can cause the so-called _cold joint_. The elements are mechanically connected but do not conduct electricity. Therefore apply solder to the hot parts but not to the tip of the soldering iron. The soldering iron is always hotter and will cause the flux to evaporate before it works.

5. Put the soldered elements into the PCB and then turn it upside down for soldering. If you do not want such items as a resistor or a LED to fall out, you can gently bend their legs out when you insert them into the board.

![](workshops/soldering/12.jpg)


## Additional tasks

Do you feel good with your skills? If so let’s get to the next step if not keep on experimenting or ask us for some help.

1. To connect the Arduino Uno with your PCB as you would do with a shield, you have to:

- plan the location of connectors through which you will connect to the Arduino Uno board. You should push your shield into the Arduino Uno.
- connect the MCP23017 expander with the appropriate pin connectors to the Arduino Uno. Pay attention to: power supply and the I2C bus.

![](workshops/soldering/10.jpg)


2. A port expander is used to ensure that your microprocessor system has more available ports than a microcontroller does. It is not only LEDs and buttons that you can connect to the system plugs. You can connect any other element which works with the digital (two-state) port of the microcontroller. Through the expander you can control a transistor, a buzzer, a tilt sensor, a servo driver. You can even connect an LCD display.

You can get out of the box!

![](workshops/soldering/15.jpg)


## Additional sources
Want to learn from masters? Check this links below.

- <http://www.youtube.com/watch?v=vIT4ra6Mo0s>
- <http://www.aaroncake.net/electronics/solder.htm>
- <http://www.sciencebuddies.org/science-fair-projects/project_ideas/Elec_primer-solder.shtml>

