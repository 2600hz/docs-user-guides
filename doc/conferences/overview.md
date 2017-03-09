# Conferencing

Conferencing:  Setting up Conference bridges via the Smart PBX, Conference Bridge Manager, User Portal 

> Who can use this feature?
> These features will be available for Hosted, Private Clouds, and Dedicated Infrastructure





## What You Should Know

The following items are all different ways to configure and access conference bridge services on Kazoo:

| Service Name | Description |
| --- | --- |
| User Portal Conferencing | How to manager and change a conference bridge from the User level |
| SmartPBX Conferencing | Setting up Master Account Conference bridge and enabling a user level access |
// | Conference Manager | Managing all the Conference bridges in real time from one portal |


>> Keep in Mind: Depending on your business needs, some services may be included in your service plan at no charge.



## User Portal Conferencing

User Portal Conferencing Tab is a simple way for an individual the manage their personal conference bridge.

If you click on the Conference tab in "User Portal"

![User Portal](./images/UserPortal_Conference.png "User Portal")

Under Setting

![Settings](./images/UserPortal_Conf Settings.png "Conference Settings")

Call-in Number:  This is the number to reach the general conference bridge (set up in SmartPBX)
Conference Number:  This is your private room (this is set up in SmartPBX)
Moderator PIN:  The pin number for the moderator to login (not required)
Participant PIN: The pin number for Paricipant to join (not required)

(checkbox) Participants join the conference muted:  Participants can not speak
(checkbox) Participants join the conference deaf:  Participants can not hear
(checkbox) Play entry tone: Anytime during the conference, a tone is played when participant joins the bridge
(checkbox) Play exit tone:  ANytime during the conference, a tone is played when a participant leaves the bridge

Global Controls:

![Global Controls](./images/UserPortal_Conf commands.png "Global Controls")


Lock:  Lock the bridge to not allow any other participants to join
Mute:  Mute All (Participants and Moderator)
Unmute Participants:  Un-Mute All (Participants and Moderator)
Hangup: Hangup the bridge (kicks everyone)


## SmartPBX Conference Bridge

The SmartPBX Conferencing services is to set up a general Conference company conference bridge and create individual conference bridge

Creating a Main Conference Number (to be used to get to all user's conference bridge - THIS MUST BE DONE FIRST)

![Main Conference Number](./images/Screen Shot 2017-03-07 at 10.05.54 PM.png "Main Conference Number")

Step One:  Add a number: Click on the "Add from Spare Numbers"
(You can add multiple numbers)
Each of these numbers will represent the same general conference bridge.

Step Two: Confirming The Main Conference Bridge Number

![Main Conferince #](./images/SmartPBX Conference Bridge.png "Main Conference Number")

Custom Greeting:  Click on "Custom Greeting" (You must have a Text To Speech provider enabled - 2600Hz is an option)
Click "Disabled" to toggle it
![Text To Speech](./images/Custom Greeting TTS.png "Enable TTS")



Type in your greeting in the main box
Hit "Save"
![Text To Speech](./images/Custom Greeting Enabled TTS.png "Enable TTS")


User Access to the Conference Bridge
Click on the "User Tab"

Click the far right box on the User you wish to enable the conference bridge

Click on "Conference Bridge"

![Turning on User Conference Bridge](./images/Individual Conference Bridge.png "User Conference Bridge")


Click "Disabled" toggle (to enable)
*You will see the Main Conference number by: Conferencing Phone Number(s)

Next to Personal Conference Room number type in the number (we recommend using your standard 4 digit extension number if you have one).  Pro Tip - If you get an error most likely it is because someone is already using this number.

Congratulations, you now have a conference bridge




## Conference Bridge Manager
TBD




