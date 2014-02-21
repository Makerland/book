# Magic Lights

## Overview

The workshop project involves using a RaspberryPi and Bluetooth 4.0 for automatically turning on a Philips Hue wireless lamp based on user proximity (using a smartphone or a device like the Fitbit). The workshop will teach participants how to use Node-RED for interacting with Objects/Smart Things. We will learn the basic elements of Node-RED, how to interface with hardware, how to write custom code and how to consume external services using APIs.

## Preparations

Make sure you have brought your RaspberryPi and a power connector for it. You will also need your laptop for connecting remotely (SSH) with your RaspberryPi or a monitor/keyboard/mouse for accessing your RaspberryPi device. To follow the workshop you need to Node.js and Node-RED on your RaspberryPi.

**Node.js**

For installing Node.js, please go to <http://nodejs.org/>, click '*Install*' and follow the instructions.

*Optionally:* To make Node.js available outside the main installation folder (e.g., `/home/node`) you can make symbolic links to node and npm as follows:

`$ sudo ln -s -f /home/node/bin/node /usr/bin/node`
`$ sudo ln -s -f /home/node/bin/npm /usr/bin/npm`

**Node-RED**

Download the latest release from the link on <http://nodered.org>. Unzip the file and go to the top level folder and execute:

`$ npm install --production`

Afterwards execute the following command to start Node-RED:

`$ node red.js`

You will see many messages on your screen, many about missing modules, don’t worry this will not affect the functionality of Node-RED. To test that Node-RED has been successfully installed and initiated, start your browser and go to:

`http://localhost:1880`

You should see something like on the image below. Now, you are ready to explore the world of Node-RED :)

![](workshops/lights/1.png)

## Main flow

### Quest 1: Hello World

Node-RED is a simple visual editor for creating executable workflows. On the left you have the list with nodes (main workflow components), known as *node-palette*,  you can use to build your workflow, grouped into various categories (input, output, etc.). Move your mouse over each node to get a short description of each node.

The main window contains the workflow editor, known as *workarea* or *canvas*, where you can place nodes and connect them to each other creating a workflow. The right part of the window contains the *sidebar*, an info panel, where information about each node is displayed among with debugging information (messages that nodes print during execution).

Let’s build the first very simple Node-RED workflow. 

From the ‘inputs’ nodes, select the **inject** one (first on the list) and drag it into the main editor area. When the node is placed on the editor, you can notice that information panel on the right containing the description of that particular node.

Now add a second node from the ‘output’ nodes. Select the **debug** node and drag it into the canvas. 

Notice the little grey square on the beginning of the **debug** node and the end of the **inject** node. These are the connection points for connecting the nodes together. Place your mouse on the connection point of the inject node, and as it becomes a cross, drag a connection to the debug node. You should have something like this:

![](workshops/lights/2.png)

Double click the inject node. The property dialog opens where you can configure the node. Enter “Hello World!” at the *Payload* textfield and click OK. See how the inject node is now renamed to “Hello World!”.

Click *Deploy* button. On the right sidebar, switch to *debug* view.

Now click the button on the left of the inject node as in the following picture and check the message on the debug window:

![](workshops/lights/3.png)

Congratulations! You have deployed and executed your first Node-RED workflow!

Node-RED can of course do much more than that. You can see on the node-palette a great collection of nodes that provide various features from creating http requests, using WebSockets and MQTT to sending SMS, Twitter and IRC messages, as well as communicating with hardware. Feel free to explore all the nodes and create custom workflows on your own! 

### Quest2: Playing with hardware - Let’s blink a LED

Let’s move on now to something more interactive! For this quest, we will use Node-RED to blink a LED on your RaspberryPi!

You might be wondering already, why there is no node related to RaspberryPi on the node palette. This is why because that particular node requires an external Node.js library (a module), that is most likely not installed yet on you system. Go to the terminal window that you used to start Node-RED. Check the error messages, you should see the following error somewhere in the beginning:

`[35-rpi-gpio-in.js] Error: Cannot find module 'pi-gpio'`

The *pi-gpio* Node.js module is missing and it is the one to install before continuing with this part of the tutorial.

First, stop your Node-RED by sending *Ctr+C* on the terminal window. You should see the following message before Node-RED exits:

`[red] Stopping flows`

Enter the following command to install the *pi-gpio* module:

`$ npm install pi-gpio`

Your Node.js environment will download all the essential software and install it. 

Now go back to your Node-RED folder and restart Node-RED:

`$ node red.js`

Scroll up to the messages, you will see that the pi-gpio missing module message is no longer there! Start your browser again and go to  <http://localhost:1880/> or simply refresh the page.

Next, connect a LED as your tutor will instruct you or as shown here:

![](workshops/lights/4.jpg)

The final step is to create a workflow that blinks the LED. While being on the Node-RED webpage, click Ctrl+I and paste the following:

<https://github.com/83tb/makerland-code/blob/master/workshops/lights/main_flow.json>

This is the way to import a workflow. Click **OK** and you will see the following workflow on your canvas:

![](workshops/lights/5.png)

Click **Deploy** and see the LED flashing!

### Quest3: Controlling a Philips Hue Lamp

Through the previous quest you have learned how to install a missing module for Node-RED and interface with hardware! Now, let’s move on to the Magic Lights: controlling a Philips Hue Lamp!

For this part of the tutorial you will learn first how to install and use external nodes. External nodes are the nodes that are built and provided by the community. There is a separate GitHub repository for external nodes provides by users here:

<https://github.com/node-red/node-red-nodes>

To use any of the external nodes you need to install first  the repository in your local Node-RED installation. Enter Ctrl+C on the terminal window to stop Node-RED execution. Now, enter the following commands:

`$ cd nodes`
`$ git clone https://github.com/node-red/node-red-nodes.git`

With this, you have all the external nodes copied into your local Node-RED installation. To make them work, you need to install their dependencies. For instance, the Philips Hue node that we will be using, depends on the node-hue-api module.

To install it, go back to the root directory of Node-RED and execute:  

`$ npm install node-hue-api`

Your Node.js environment will do the rest for you. Restart your Node-RED and refresh your browser. Check your node-palette, under the advanced group. You should see 2 new nodes!

![](workshops/lights/6.png)

**Discover** node and **HueNode**. Click on each node and see on the information tab a brief description of what each node does. You can play with Discover node on your own, we will move directly to the HueNode for controlling the light!

Drag an **inject** node on your canvas and a **HueNode**. Doubleclick on the **inject** node to edit it and enter ON as topic and click Ok.
Double click the **HueNode** node. Enter the following string to the username field:

`34fcc05c38c1a66f9cc1a34394809e7`

Type in a number between 1-3 for the Lamp ID, select the Lamp status to ON. 

To enter a color value for changing the lamp’s color, you need to find the html code of the color you want. Go to <http://html-color-codes.info/> click on a color and copy the generated color value (starting with #). Paste the color value on the Select Color filed (without the #):

![](workshops/lights/7.png)

Click OK and connect the inject node with the HueNode. Also, add a debug node and connect the output of the HueNode with the debug node:

![](workshops/lights/8.png)

Click **Deploy** button. Now, click the button on the left on the inject node and see the light turning on and changing its color!

Experiment on your own with turning the lights on or off and with the colour lights.

## Second flow

For this part you will do something more advanced but also more exciting! You will learn how to use Bluetooth Low Energy (BLE or Bluetooth 4.0) to automatically turn on or off the lights based on user proximity. User proximity is detected for example by having on the Bluetooth of your smartphone on or by using a wearable device like the Fitbit.

For this part of the tutorial you will use another external node, the scanBLE node. This node has been already copied into your Node-RED installation from the previous step, but you need to install its dependency to activate it.

Stop your Node-RED (Ctrl+C) and enter the following command:

`$ npm install noble`

As soon as installation is complete, restart your Node-RED and refresh your browser.

Check the node-palette under the advance group. You should see the new scanBLE node. Click on it and check on the Info tab what it does and how it works.

![](workshops/lights/9.png)

Import the following workflow into your canvas (Ctrl+I):

<https://github.com/83tb/makerland-code/blob/master/workshops/lights/second_flow.json>

You should have something like the following:

![](workshops/lights/10.png)

Double click the **Check** node and edit it according to your BLE devices preferences. Then double click the **switch** node and change the Fitbit name to whatever the name of your BLE device is. Click the button on the inject node. When your BLE device is in proximity, it will be detected by the Check node. The output of the Check node will trigger the switch node that in turn will turn on the Hue Lamp!

## Additional tasks

Now that you are quite familiar with the logic of Node-RED and the PhilipsHue node  you can experiment with additional nodes. For example you can use the Twitter Node and custom code to change light color/make the lamp blink on twitter hashtags!

## Additional resources

- Learn more about Node-RED: <http://nodered.org/> and <http://nodered.org/docs/>
- Connect your Arduino to Node-RED: <http://nodered.org/docs/hardware/arduino.html>
- Learn how to create your own Node-RED node: <http://blog.buildinginternetofthings.com/2013/11/09/creating-a-node-for-node-red-the-philips-hue-node/>
- Information on hacking the Phlipis Hue: <http://rsmck.co.uk/hue>
- Use Bluetooth Low Energy (BLE) with Node.JS: <https://github.com/sandeepmistry/noble>
