# Provisioning Cisco SPA

This is a guide to auto-provision a Cisco SPA 300, 500 and 900 series.

> Who can use this feature?
> Administrators who are deploying phones hooked up to our provisioning service.

## Steps to Auto Provision device

1. Add Device
    - First add the device to Provisioner by following the instructions here: [Adding Devices Guide](../prov_start_guide.md)
2. Reset to Factory Settings
    - Please also make sure that you have reset your device to factory settings. In most cases, you will have to reboot the phone manually the first time and it will then reboot and load the configuration automatically (It might take a few minutes).
    - To Factory Reset a Cisco device:
    - Click on the Menu Button (images/cisco-button.png)
    - Select 14: Factory Reset
    - Select OK at the Reset Warning, and the device will commence Factory Reset and Initialization.
3. Obtain the IP Address
    - In order to provision a Cisco phone, you will first need to get its IP address in order to access the phone's web interface. To do so, click on the Menu Icon, which is shown in the photo. Then you will select “Network” which is typically “9.” The IP address should be the second line, for example: "IP: 10.10.9.88".
4. Enter the IP Address and Login
    - In your browser now, enter the device’s IP address. You should see something like this: (images/cisco-start.png)
5. Autoprovision Device
    - First click on "Admin Login" in the top right-hand corner and then "advanced," which is right next to it. (images/cisco-admin-login.png)
    - Then click on the provisioning menu, which is a tab located at the top of the screen. (images/cisco-provision-tab.png)
    - Input the "Profile Rule" which is the same as the provisioning url http://p3.zswitch.net:80/$MA.xml and set the "Transport Protocol" to "http." (images/cisco-auto-provision.png)
    - Lastly, select “Submit All Changes.” The device will reset as it is auto provisioning and the should read below: (images/cisco-waiting.png)

After a minute or two, the device will be auto provisioned and should look something like this: (images/cisco-end.png)
