# Cirqoid


## Overview 

At Cirqoid station you can sharpen your skills in production of custom design printed circuit boards. You will be provided with all the necessary things and equipment to mill, populate with components and solder your own battery powered thermometer. It's rather a station than a workshop and that is why this tutorial is so short ;)


## Main Flow

Thermometer is operated by atmega88 microcontroller, reads temperature form DS18B20 sensor and displays the temperature on seven segment LED indicator.

### Design your PCB and mill!!

First thing you’ll have to do is to mill the board for the thermometer. You will be provided with Gerber and Excellon files (the files with board layout ready to be milled) and a Cirqoid PCB prototyping machine. Following online documentation and consulting Cirqoid gurus you’ll breeze through milling the traces of this board and drilling the holes.

### Adding solder paste

Next step is going to be putting some solder paste on the pads of the components. Not much to worry about here - you’ll change a spindle in Cirqoid machine to solder paste syringe and the pads will be ready to receive there components in no time.

Now go the components - you’ll guide Cirqoid pick and place head in placing the components on your board. This board isn’t heavily populated, so this won’t hold you for long.

![](workshops/cirqoid/image.jpg)

### Cooking time!

After that, it’s cooking time - the board goes to the oven. Several minutes and it’s almost ready to enjoy.

### Soldering

Now, the last thing that stands between you and the Knowledge (about the ambient temperature) is soldering though the hole components - we’ve got a sensor, a indicator and a header for power supply.

![](workshops/cirqoid/image2.jpg)

When you are done with that the thermometer is your for taking! Now you’ll be always in control of your climate!



