
Hacking Hens’ Happiness
Overview
Learn how to use Raspberry Pi and its Camera module to take photos (and videos) without being bound by having a screen, keyboard and mouse directly attached.

What’s the story? We have hens at home - 7 to be exact - with one “time-shared” nest.
Our problem : To know when to collect eggs in the Chicken Coop without :

  1. disturbing the busy, kindly egg-layer on her “throne” (ie. avoiding “Angry Birds syndrome”)
  2. having to go out into the cold & mud sometimes for no reward.

Solution : The Pi as a remote laying surveillance system → Have you any Eggs?

So here, if you’re a beginner we’ll set up our RPI & remotely control it to take photos of eggs (no live chucks today unfortunately) and if you’re already familiar with the basic workings we’ll build on that to watch streaming action or inform us automatically of nest activity!
Preparations
All we need is readily available online and we’ve put much of it on the USB Stick to speed things up a bit. So copy the contents of our USB stick to your laptop. (See the Annex at the end for full list of sources and links)

It’s good to start with a “clean slate”, so let’s begin by formatting your SD card from your laptop (for Windows & Mac → use SD Formatter 4.0 {using Options: Type “Quick” + Format Size Adjustment “Yes”} , for Linux → use Gparted or parted as “Win32”).

Our Raspberry Pi is designed to be run under the GNU/Linux Operating System and we’ll be using the distribution (or “flavour”) recommended by the Foundation: Raspbian OS. We can now write our OS image to the SD Card (Windows → Win32DiskImager, Mac → PiWriter,Linux →using ImageWriter or command “dd”)[1]

While our card is “cooking”, why not take the time to plug in all the elements as indicated below (leaving our SD card & micro-USB power cable to last). Just a note: be aware that the Camera Module is a “static sensitive” device & the visible metal contacts on the cable should face away from the Ethernet socket, gently lowering the catch to hold it in place.
Main flow

1. Boot up.
So with our SD Card ready, let’s put it in its slot on the Raspberry Pi. It’s now the equivalent of a hard drive with your operating system. It has the advantage of being flash memory (i.e. quick access) even if slightly limited in its capacity (of course you can easily use network storage or external HDD if needs be).

Now plug in your power supply with the micro-USB connection (like most recent mobile phone chargers)...and away we go! We should see the LEDs lighting (and certain ones flashing) to let us know that we’re up and running.

2. Take control and see what’s going on!
For this we’re going to use a system called VNC (Virtual Network Computing) which is similar to (though somewhat less secure than) tools like Remote Desktop/Teamviewer/LogMeIn etc. It is simply a way of remotely accessing your Graphical User Interface (Desktop Environment). When you’re more at ease you can always use command line to make the Pi do your every  bidding.

Many VNC applications are available. With Windows we’ll use TightVNC Viewer. With Mac, Real VNC Viewer can be used. For Linux we can use Remmina (with Ubuntu) for example.

If we connect directly via our Ethernet cable, the IP address and port which we’re using (i.e. the directions to find the door to our Desktop) are indicated thus : 168.254.0.2:1 
The current password (i.e. the key to get in the door) is : funexpi


TightVNC Viewer connection page 

3. Take a look around.
You should, at this point having entered your VNC password, find yourself in front of your desktop interface emblazoned with the bright Raspberry Pi logo.


Now’s the time to familiarise yourself with this new world. Check out the menu from the bottom left corner to see the various program categories. Alongside is the File Manager.

The “Pi” in Raspberry Pi comes from the “Python” language. There are Tools for programming - IDLE as well as some pre-created Python Games using the language.
Scratch from MIT is a utility with education in mind, for learning and teaching the building blocks and basic logic of coding. Midori is a web browser.

Abundant information about the various packages are available through the sitehttp://www.raspberrypi.org (in particular via the Forums) and in the community documentation Hub via http://elinux.org/RPi_Hub 

What we’re now interested in will involve the LXTerminal which you’ll find on the desktop. This will allow us to launch the command line interface and capture images from the camera module.

4. Take some Photos.
The command line can be daunting if you’re not familiar with it. If you only know a little or none of the “black screen with white (or coloured) writing” it can be hard to know where to start. Indeed the “prompt” itself (under Linux the “$”) is the computer waiting for you to tell it what you want it to do! But don’t worry, it’s easier than you think...and much more powerful than you think ! =o)

So double click LXTerminal Icon and off we go.

Command line is in many ways a language just like many others. As you gradually learn the terms and translate what you want to say so the computer understands you’ll feel more and more at ease. We can’t cover many details in this document as this is not a Linux/Command line “primer” but a few useful basics follow, with few more in the “cheat sheet” to get you started.

First question to the computer:
Where am I ? → to ask this we type simply pwd (meaning print working directory) The computer replies /home/pi (the complete path to our current “folder”)
Let’s create a folder for the images we’re about to take:
Make a directory called funex → mkdir funex
Change directory to funex → cd funex

Get your egg ready for its “photo shoot”. Place it in front of the lens.
Now comes the command  to take a “still image” with the camera module and well save it as “egg1.jpg”.
raspistill -o egg1.jpg

If you now launch the File Manager from the toolbar of the desktop and navigate to /home/pi/funex/ we’ll find the photo file we just created and by double clicking we can view the photo.

Now play around with some of the various options available. At any time you can see the manual of the app just by entering raspistill without any options after it.

More details can be found on http://www.raspberrypi.org/camera and comprehensive page is on http://elinux.org/Rpi_Camera_Module 

5. Pick up those photos

One last task for this flow, how to get your photos off your Pi?
We can easily use File Transfer Protocol to collect and transfer the photos from our remote Raspberry to our local laptop. We can navigate the remote directories & download them locally.
Install a utility such as Filezilla and connect to your IP address using a connection type “SFTP” (“S” being for “Secure”).
In this case, as long as we haven’t changed the default details it should be :
Login: pi Password: raspberry

If you’ve decided to play around with the video capture app raspivid you can then use a media player such as VLC Videolan to playback those high-definition recordings (format *.h264).

A little finishing word for this section :
What we’ve just done may seem somewhat basic, but we have the building blocks to make various remote surveillance projects just by adapting and adding to what we’ve learnt. Nest box/bird-table observation, time-lapse photography, home security camera…

A year ago BBC Click broadcast a TV section entitled “Can anyone do DIY tech?”. The answer is obviously “yes” as we’re all here today. So some encouraging words for us from Dominic Morrow (co-founder of Nottingham Hackspace) : “It doesn’t matter if you don’t know everything. Don’t put obstacles in your way that say ‘Before I can make an electronics thing, I have to learn all of electronics’ or ‘before I can program something I need to know everything about computers’. It’s simply not true! Most people start out knowing nothing about what they’re doing, but by chipping away at a problem, they become, slowly, more and more adept at doing it.”

Second flow
Maybe you already know your chmod from your chown and your ssh from your vnc? Or perhaps the Main Flow has whetted your appetite for more?

For you I’ve added in the next flow tasks based on Motion detection and Twitter notification.


FAQ
Q : What is Raspbian?
A :         The Raspbian Operating System is a Pi-dedicated Linux distribution ported by the community to function on the platform and based on the widespread Debian (Wheezy) “flavour” of Linux. Many other versions of OS are available (see RPI website - downloads section), but this is the recommended and most popular one.

Q : What’s the resolution of the Camera Module?
A :         It can take images up to 5 megapixels and video at Full HD @30 frames per second

Q : Can I preview on the screen?
A :         Yes, if your monitor is directly attached.
No, if using a remote viewer (VNC/X-Session)

Q : Can I extend the camera cable?
A :         Yes it’s possible. Some kits are available online and has been confirmed up to 4m.

Q : Why use the Pi Camera Module rather than a webcam?
A :         Small
        Inexpensive
High quality
Low power consumption
NoIR version allows night-time/Infrared capture
Additional resources
For all things officially Raspberry Pi® : http://www.raspberrypi.org
For general technical Raspberry Pi help : http://elinux.org/RPi_Hub 
For basics of Camera Module : http://www.raspberrypi.org/camera 
For in-depth Camera Module technical help : http://elinux.org/Rpi_Camera_Module

Useful online Tutorial resources used in the mashing of this workshop :

   * Headless Setup : Meltwater’s RPI Remote Connections - Without a Network -http://pihw.wordpress.com/guides/direct-network-connection/in-a-nut-shell-direct-network-connection/ 
   * Adafruit : Tutorial on VNC setup http://learn.adafruit.com/adafruit-raspberry-pi-lesson-7-remote-control-with-vnc/running-vncserver-at-startup 
   * Camera Tutorial - the Raspberry Pi Guy - http://www.youtube.com/watch?v=T8T6S5eFpqE

        See Also : http://www.theraspberrypiguy.com/tutorials/

   * Surveillance Camera Tutos :

Instructables RPI Surveillance Camera from Scavix -http://www.instructables.com/id/Raspberry-Pi-as-low-cost-HD-surveillance-camera/ 
http://jawwig.wordpress.com/2013/11/19/setting-up-raspberry-pi-security-cam-on-model-a-or-b-with-minimal-armhf-image/ 

   * Triggering events from Motion using Python - https://medium.com/p/2d5a2d61da3d 
   * RPi Twitter Bot - http://www.makeuseof.com/tag/how-to-build-a-raspberry-pi-twitter-bot/ 
   * Tweeting using Python (Twython application) -https://twython.readthedocs.org/en/latest/ 
   * Quick guide to Nano Text Editor on RPI - Raspberry Pi Spy - http://www.raspberrypi-spy.co.uk/2013/11/quick-guide-to-nano-text-editor-on-the-raspberry-pi/


Selected Bibliography
Raspberry Pi User Guide (Second Edition) - Eben Upton & Gareth Halfacree
Programming the Raspberry Pi (Getting started with Python) - Simon Monk
Adventures in Raspberry Pi - Carrie-Anne Philbin
Raspberry Pi Projects for the Evil Genius- Donald Norris
Going Further
Python Picamera Module - Dave Jones : http://www.raspberrypi.org/archives/5672 
Latest version at : https://pypi.python.org/pypi/picamera 
Documentation for Picamera V1.0 : http://picamera.readthedocs.org/en/release-1.0/ 
Graphical interface for raspistill : http://www.raspberrypi.org/phpBB3/viewtopic.php?p=374577 
Using Open CV for Object Recognition :
Raspberry Pi facial recognition - http://www.raspberrypi.org/archives/4207 
OpenCV and Pi Camera Board - Pierre Raufasthttp://thinkrpi.wordpress.com/2013/05/22/opencv-and-camera-board-csi/ 

Recognising other objects rather than faces (eg. Banana) :
Train Your Own OpenCV Haar Classifier - Thorsten Ball (on the site of Robin Mehner...here present @Makerland!) - http://coding-robin.de/2013/07/22/train-your-own-opencv-haar-classifier.html 

Samba setup for network filesharing - http://raspberrywebserver.com/serveradmin/share-your-raspberry-pis-files-and-folders-across-a-network.html 

For other “Hen House” linked ideas (involving motorisation/automatisation etc)  :
Presentation Gertduino board for Pi : http://www.raspberrypi.org/archives/5308 
For conversation on Hen Tech : http://www.raspberrypi.org/archives/5308#comment-409617 Gertduino Manual - http://www.element14.com/community/docs/DOC-64534/l/user-manual-for-gertduino-board 

General Inspiration on DIY Tech - BBC Click : http://www.bbc.co.uk/programmes/p0154nlx 

ANNEX
Contents of Project/Useful files :
SD Formater 4.0 (via https://www.sdcard.org/downloads/formatter_4/)
Win32 Disk Imager (via http://sourceforge.net/projects/win32diskimager/)
Lastest Raspbian OS Image (via http://www.raspberrypi.org/downloads)
Raspberry Pi® Quick Start Guide (via http://www.raspberrypi.org/wp-content/uploads/2012/04/quick-start-guide-v2_1.pdf)
Putty - Tools for SSH (via http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html)
Filezilla - FTP Client (via https://filezilla-project.org/download.php?type=client)
VLC Videolan - Media player (via http://www.videolan.org/vlc/)  
TightVNC - Viewer (via http://www.tightvnc.com/download.php) 

[1] For detailed explanations : http://elinux.org/RPi_Easy_SD_Card_Setup 