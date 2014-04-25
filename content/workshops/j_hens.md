\newpage
\thispagestyle{empty}
\mbox{}

\newpage

![](content/workshop_images/hens.jpg)

\customtitlepage{Hacking Hens’ Happiness}

>Applying connected technology to improve your Hens' happiness & productivity. Remote laying surveillance to know when you can count your chickens before they've hatched. We will learn how to keep yourselves informed each time a feathery friend drops an "object" on a "nested loop". So which came first? The chicken or the egg? 

### Authors

__Alan McCullagh__ is Irish, from Kilkenny, and has been living in the Rhône Valley in Provence, France for the past ten years. He has been working in customer support for a software/tech solutions company for almost 6 years and before that helped teaching English while keeping very old computers on life support in a language training centre. He likes rowing and answering questions when people ask why he wears a Raspberry lapel-pin all the time. He's interested in environmental concerns & the welfare of various "feathered friends". A child of the BBC-Micro generation, he hopes to see ICT more and more in schools.

\newpage

# Hacking Hens’ Happiness

## Overview

Learn how to use Raspberry Pi and its Camera module to take photos (and videos) without being bound by having a screen, keyboard and mouse directly attached.

What’s the story? We have hens at home - 7 to be exact - with one “time-shared” nest.

__Our problem__ is to know when to collect eggs in the Chicken Coop without:

- disturbing the busy, kindly egg-layer on her “throne” (ie. avoiding “Angry Birds syndrome”)
- having to go out into the cold & mud sometimes for no reward.

__Solution__: The Pi as a remote laying surveillance system → Any eggs in the nest?

So here, if you’re a beginner we’ll set up our RPI & remotely control it to take photos of eggs (no live chickens today unfortunately). If you’re already familiar with the basic workings we’ll build on that to watch streaming action or inform us automatically of nest activity!

## Preparations

![](content/workshops/hens/3.jpg)

All we need is easily available online and we’ve put much of it on the USB Stick to speed things up a bit. Copy the contents of our USB stick to your laptop (see the *Appendix* at the end for full list of sources and links).

It’s good to start with a “clean slate”, so let’s begin by formatting your SD card from your laptop:

- __Windows & Mac__: use SD Formatter 4.0 (using *Options* -> Type “Quick” + Format Size Adjustment “Yes” 
- __Linux__: use Gparted or parted as “Win32”.

Our Raspberry Pi is designed to be run under the GNU/Linux Operating System and we’ll be using the distribution (or “flavour”) recommended by the Foundation: Raspbian OS. We can now write our OS image to the SD Card:

- __Windows__ → Win32DiskImager, 
- __Mac__ → PiWriter, 
- __Linux__ →using ImageWriter or command “dd”). 

For detailed explanations, see this: <http://elinux.org/RPi_Easy_SD_Card_Setup>

While our card is “cooking”, why not take the time to plug in all the elements as indicated below (leaving our SD card & micro-USB power cable to last). 

> Be aware that the Camera Module is a “static sensitive” device & the visible metal contacts on the cable should face away from the Ethernet socket, gently lowering the catch to hold it in place.


## Main flow

### Boot up

With our SD Card ready, let’s put it in its slot on the Raspberry Pi. It’s now the equivalent of a hard drive with your operating system. It has the advantage of being flash memory (i.e. quick access) even if slightly limited in its capacity (of course you can easily use network storage or external HDD if needs be).

Now plug in your power supply with the micro-USB connection (like most recent mobile phone chargers)...and away we go! We should see the LEDs lighting (and certain ones flashing) to let us know that we’re up and running.

### Take control and see what’s going on!

For this we’re going to use a system called VNC (Virtual Network Computing) which is similar to (though somewhat less secure than) tools like Remote Desktop / Teamviewer / LogMeIn etc. It is simply a way of remotely accessing your Graphical User Interface (Desktop Environment). When you’re more at ease you can always use command line to make the Pi do your every bidding.

Many VNC applications are available. With Windows we’ll use TightVNC Viewer. With Mac, Real VNC Viewer can be used. For Linux we can use Remmina (with Ubuntu) for example.

If we connect directly via our Ethernet cable, the IP address and port which we’re using (i.e. the directions to find the door to our Desktop) are indicated thus: __168.254.0.2:1__
The current password (i.e. the key to get in the door) is: __funexpi__

![TightVNC Viewer connection page](content/workshops/hens/1.jpg)

### Take a look around.

You should, at this point having entered your VNC password, find yourself in front of your desktop interface emblazoned with the bright Raspberry Pi logo.

![](content/workshops/hens/4.jpg)

Now’s the time to familiarise yourself with this new world. Check out the menu from the bottom left corner to see the various program categories. Alongside is the File Manager.

> The “Pi” in Raspberry Pi comes from the “Python” language. There are tools for programming - including IDLE as well as some pre-written Python Games using the language. Scratch from MIT is a utility with education in mind, for learning and teaching the building blocks and basic logic of coding. Midori is a web browser.

Abundant information about the various packages are available through the site: <http://www.raspberrypi.org> (in particular via the Forums) and in the community documentation Hub via <http://elinux.org/RPi_Hub>

What we’re now interested in will involve the LXTerminal which you’ll find on the desktop. This will allow us to launch the command line interface and capture images from the camera module.

### Take some Photos.

The command line can be daunting if you’re not familiar with it. If you only know a little or none of the “black screen with white (or coloured) writing” it can be hard to know where to start. Indeed the “prompt” itself (under Linux the “$”) is the computer waiting for you to tell it what you want it to do! But don’t worry, it’s easier than you think...and much more powerful than you imagine! 

So double click LXTerminal Icon and off we go.

![](content/workshops/hens/2.jpg)

Command line can be thought of as a language just like many others. As you gradually learn the terms and translate what you want to say so the computer understands you’ll feel more and more at ease. We can’t cover many details in this document as this is not a Linux/Command line “primer” but a couple of useful basics follow, with a few more in the “cheat sheet” to get you started.

First question to the computer:

Where am I ? → to ask this we type simply `pwd` (meaning print working directory) and then press *Enter*. The computer replies __/home/pi__ (ie. the complete path to our current “folder”)

Let’s create a folder for the images we’re about to take:

- **M**a**k**e a **dir**ectory called funex → `mkdir funex`
- **C**hange **d**irectory to funex → `cd funex`

Get your egg ready for its “photo shoot”. Place it in front of the lens.
Now the command to take a “still image” with the camera module and save it as “egg1.jpg”:
	
	raspistill -o egg1.jpg

If you now launch the File Manager from the toolbar of the desktop and navigate to */home/pi/funex/* we’ll find the photo file we just created and by double clicking it opens in the Image Viewer.

At any time you can see the manual of the app just by typing `raspistill` and *Enter*. Now play around with some of the various options available.

More information can be found on <http://www.raspberrypi.org/camera> and a further comprehensive page is on <http://elinux.org/Rpi_Camera_Module>

### Pick up those photos

One last task for this flow, how to get your photos off your Pi?

We can easily use File Transfer Protocol to collect and transfer the photos from our remote Raspberry to our local laptop. We can navigate the remote directories & download them locally.

Install a utility such as Filezilla and connect to your IP address using a connection type “SFTP” (“S” being for “Secure”).

In this case, as long as we haven’t changed them, default details should be:

- Login: **pi**
- Password: **raspberry**

You can change your password at any time from LXTerminal by `sudo raspi-config` or `passwd`.

If you decide to play around with the video capture app **raspivid** you can then use a media player such as VLC on your laptopt to playback those high-definition recordings (format *.h264).

### Summary

What we’ve just done may seem somewhat basic, but we have the building blocks to make various remote surveillance projects just by adapting and adding to what we’ve learnt. Nest box/bird-table observation, time-lapse photography, home security camera…

A year ago BBC Click broadcast a TV report entitled “Can anyone do DIY tech?”. The answer is obviously “yes” as we’re all here today. So some encouraging words for us from Dominic Morrow (co-founder of Nottingham Hackspace): 
> “It doesn’t matter if you don’t know everything. Don’t put obstacles in your way that say ‘before I can make an electronics thing, I have to learn all of electronics’ or ‘before I can program something I need to know everything about computers’. It’s simply not true! Most people start out knowing nothing about what they’re doing, but by chipping away at a problem, they become, slowly, more and more adept at doing it.”

## Second flow

Maybe you already know your `chmod` from your `chown` and your `ssh` from your `vnc`? Or perhaps the Main Flow has whetted your appetite for more?

For you I’ve added in the next flow tasks based on Motion detection and Twitter notification. Keep an eagle eye continuously on that nest and be informed of the freshest produce!
For this part we’ll need to be logged in to our RPi by SSH (e.g. using Putty or Terminal). 

Default Login: __pi__
Password: __raspberry__
Default IP address (by ethernet): __169.254.0.2__

(To work via wireless network check the additional IP address using `hostname -I` & connect)

### Setting the Eggs in Motion

We like automating. And we can do all sorts of fun things when we capture real life events and make things happen thanks to them. For this bit most of the setup has already been done for you in the OS image. The installed Motion package adds automatic movement detection for triggering of events & also an easy way of streaming in addition to the basic apps of raspistill & raspivid in our 1st flow.

Big Rooster is always watching! So that our module will run in the background as a daemon, we activate the service at boot-up: 
`sudo nano /etc/default/motion` and change the value of *“start_motion_daemon”* to *“yes”*.

Now let’s get that running straight away without reboot: `sudo service motion start`

We can now see our “Live (Chicken) feed” from the Camera by launching VLC Media player or Firefox or Safari browser on our Laptop and pointing it to our IP address on port 8080 eg. __169.254.0.2:8080__.

![](content/workshops/hens/image06.jpg)

At this point, play around with the many configurable options in Motion by editing the &/etc/motion.conf& file. A complete list of options can be found at <http://www.lavrsen.dk/foswiki/bin/view/Motion/ConfigFileOptions>

Any changes made to the *.conf file can be applied by relaunching the daemon/service using: 

	sudo service motion restart

Our photos and videos in the initial config are saved to */home/pi/camMotion/*

Some examples of what can be changed/played with: 

- Sensitivity of the triggering (Threshold)
- Text displayed on the image overlay
- Boxing of the image area where movement is detected
- Rotation of image (depending on your installation)
- Usual image parameters of Brightness, Contrast, Saturation, Hue, etc
- Password protection of the Video Stream/Feed

### Tweeting Hens - Have you any Eggs?

Hen’s aren’t always terribly communicative so let’s send a latest image by Twitter every time there is activity around the nest.

The idea: to use our Motion configuration to trigger a Python script sending our newest image.

To do this, we create a new dedicated Twitter account (with private rights if you don't want your hens being public!) on <https://twitter.com/>. Of course you’re free to use an existing account too.

We log in to <https://dev.twitter.com>, going through *My Applications* and *Create New App*.

We need to be able to authenticate securely and publish our feathered Tweets so adjust the Access level to be able to Write to Twitter. What we need now are the Consumer key, Consumer secret, Access token & Access token secret.

![](content/workshops/hens/image01.jpg)

Edit and update the “placeholders” in */home/pi/camMotion/eggTweet.py* script with your Consumer/Access keys & tokens.

Best to check all’s ok before heading on, so let’s try testing the script at this point by running:

	python /home/pi/camMotion/eggTweet.py

If there are no errors, have a look at your Twitter account. You should find that you’ve just sent a message with your last recorded image in the camMotion directory.

You can decide on what event you’d like to send your tweet. I’ve added an example to the */etc/motion.conf* file for triggering once a video has finished recording. To activate this example we just need to “uncomment” the following line in the *motion.conf* file by removing the “;”

	; on_movie_end python /home/pi/camMotion/eggTweet.py

As previously, when we’ve modified the configuration, relaunch motion with 

	sudo service motion restart

You should now automatically send a tweet as soon as your video has stopped being recorded.

### Summary

What I’ve been able to watch with a “bird’s-eye view”: the “pecking order” at work (up to 3 hens at once trying to get on the nest), surprise guests (regular visiting mice), when and by whom the eggs are laid & gathered, à whole lot of broody & bossy chucks. 

I’ve learnt to play with and use all this thanks to other people’s hard work and the wealth of online resources. I hope it’s of some use to you in this station. Now it’s your turn to be creative and run on and build with this. Have fun and share with others ;) Raspberry Pi has its “raison d’être” in learning and teaching. Bonne continuation!

## FAQ

__What is Raspbian?__

The Raspbian Operating System is a Pi-dedicated Linux distribution ported by the community to function on the platform and based on the widespread Debian (Wheezy) “flavour” of Linux. Many other versions of OS are available (see RPI website - downloads section), but this is the recommended and most popular one.

__What’s the resolution of the Camera Module?__

It can take images up to 5 megapixels and video at Full HD @30 frames per second

__Can I preview on the screen?__

Yes, if your monitor is directly attached.
No, if using a remote viewer (VNC/X-Session)

__Can I extend the camera cable?__

Yes it’s possible. Some kits are available online and has been confirmed up to 4m.

__Why use the Pi Camera Module rather than a webcam?__

- Small
- Inexpensive
- High quality
- Low power consumption
- NoIR version allows night-time/Infrared capture

## Additional resources

- For all things officially Raspberry Pi®: <http://www.raspberrypi.org>
- For general technical Raspberry Pi help: <http://elinux.org/RPi_Hub>
- For basics of Camera Module: <http://www.raspberrypi.org/camera>
- For in-depth Camera Module technical help: <http://elinux.org/Rpi_Camera_Module>

Useful online tutorial resources used in the making of this workshop:

- Adafruit: Tutorial on VNC setup: <http://learn.adafruit.com/adafruit-raspberry-pi-lesson-7-remote-control-with-vnc/running-vncserver-at-startup>
- Camera Tutorial - the Raspberry Pi Guy: <http://www.youtube.com/watch?v=T8T6S5eFpqE>
- Raspberry Pi Tutorials: <http://www.theraspberrypiguy.com/tutorials/>

Surveillance Camera Tutorials:

- Triggering events from Motion using Python: 
- <https://medium.com/p/2d5a2d61da3d>
- RPi Twitter Bot: <http://www.makeuseof.com/tag/how-to-build-a-raspberry-pi-twitter-bot/>
- Tweeting using Python (Twython application): <https://twython.readthedocs.org/en/latest/>

Going Further:

- Python Picamera Module - Dave Jones: <http://www.raspberrypi.org/archives/5672> (latest version at: <https://pypi.python.org/pypi/picamera>)
- Documentation for Picamera V1.0: <http://picamera.readthedocs.org/en/release-1.0/>
- Graphical interface for raspistill: <http://www.raspberrypi.org/phpBB3/viewtopic.php?p=374577>

Using Open CV for Object Recognition:

- Raspberry Pi facial recognition - <http://www.raspberrypi.org/archives/4207>
- OpenCV and Pi Camera Board - <http://thinkrpi.wordpress.com/2013/05/22/opencv-and-camera-board-csi/>
- Train Your Own OpenCV Haar Classifier - Thorsten Ball: <http://coding-robin.de/2013/07/22/train-your-own-opencv-haar-classifier.html> 

## Appendix

Contents of project and useful files:

- SD Formater 4.0 - <https://www.sdcard.org/downloads/formatter_4/>
- Win32 Disk Imager - <http://sourceforge.net/projects/win32diskimager/>
- Lastest Raspbian OS Image - <http://www.raspberrypi.org/downloads>
- Raspberry Pi® Quick Start Guide - 
- <http://www.raspberrypi.org/wp-content/uploads/2012/04/quick-start-guide-v2_1.pdf>
- Putty - Tools for SSH - <http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html>
- Filezilla - FTP Client - <https://filezilla-project.org/download.php?type=client>
- VLC Videolan - Media player - <http://www.videolan.org/vlc/>
- TightVNC - Viewer - <http://www.tightvnc.com/download.php>
