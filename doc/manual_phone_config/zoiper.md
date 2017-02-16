
## Manually configure Zoiper softphone

### Where to get info

Values for filling in the zoiper fields are found in Kazoo's UI's device details. Kazoo's UI is called Monster, for future reference.
You probably created a Softphone type device so the settings should be on the basic tab. Most other types you will find them in the Advanced, SIP tab.

### Configuring Zoiper

 1. On zoiper, click Settings, Preferences.
 2. On the left, near the bottom, click Create account
 3. Select SIP, click Next.
 4. NOTE: To paste in the zoiper field you have to right click the field and select Paste.
 5. for user@host copy the username@realm as found in field's matching username and realm in Monster UI.
 6. for password, copy the password from the password field in Monster UI.
 8. Click Next.
 9. Give it a short meaningfull name like "Jay office".
 10. Check Skip auto-detection.
 11. Click Next then Close.

####On the General tab

 1. Domain should be already set to the devices realm.
 2. Username should already be set to match what is in Monster.
 3. Password should also already be set to what you copied from Monster.
 4. "Use outbound proxy": check
 5. Outbound proxy: one of the following depending on which is closest to you. You may want to check ping times.
  us-west.p.zswitch.net
  us-central.p.zswitch.net
  us-east.p.zswitch.net

####Account's Extra tab

 1. Register on startup: Check
 2. Voicemail extension: *98<your voicemail box extension>
 3. nothing else checked or filled in for this tab

####Account's Advanced tab

 1. registrations expiry: 600
 2. Keep alive timeout: custom: 15
 3. Dropdowns along right should see
 4. "Use DTMF RFC-2833"
 5. "Use UDP transport"
 6. "TLS with no SRTP"
 7. "Don't use STUN"     <- VERY IMPORTANT
 8. "Use certificate as:" "Don't use"
 9. Use rport: Checked
 10. Use rport media" Checked
 11. NOTHING ELSE checked or filled out. 

We do not use STUN, TURN or anything else like that. They just mess things up.
Note that the Outbound proxy addresses have SRV records so in the case of a outage to the primary location, the phone will be able to make outbound calls normally and within 300 seconds re-register to get calls through the failover route.
DO NOT decrease the registration's expiry below 600 seconds. With an expiry of 600 it will actually re-register every 300 seconds (5 min). Lower values put too much load on the servers.

Also refer to the SIP best practices and Troubleshooting guide
https://community.2600hz.com/customer/portal/articles/2130224
