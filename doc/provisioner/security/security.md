# Security

This is a guide on how Provisioner handles security.

> Who can use this feature?
> Administrators who are deploying phones hooked up to our provisioning service.

## Intro

The idea and goal of security is to work completely in the background without it changing too much of the current behavior. We also wanted a single method that could work across all brands and models. This way we remove the complexity of customizing authentication per brand/model which could introduce more errors on top of making it more difficult to manage.

## Security through Obscurity

Our solution was to use security through obscurity. We accomplished this by nesting the config files into generated folder names so they aren't accessible without knowing the full path. This is in affect now, but only for any devices created after the security update as we did not migrate older devices over.
The generated path takes a hash of the account and hash of the device and prepends that before the MAC.cfg or MAC.xml file resulting in something like this: `http://p3.zswitch.net/account_hash/device_hash/001565abcdef.cfg`. Every account has a hash generated on creation as well as every device.

## Initial Provisioning Phase

With the introduction of the hashed directories, we needed to add an additional step to the provisioning process. This happens automatically, so it doesn't change how auto-provisioning works. Now, when a phone is initially provisioned using the base provisioning URL, it'll a provisioning script will pick up the request. It then generates a partial config file that contains the hashed directory path and ensures certain settings are enabled/disabled so that provisioning would continue. For example, Option 66 needs to be turned off for provisioning to continue since Option 66 will overwrite the new provisioning URL.

## Security Benefits

One of the security benefits with using hashed directories is that it's much harder to scan for config files. Before, all the config files were stored in the root provisioner directory so it was possible to simply iterate through possible mac addresses to get a config file. As a security measure to stop this, we added fail2ban which bans an IP address making 15-20 failed requests within a short period of time. By moving the config files into hashed directories, we significantly decreased the likelihood of successful scanning for config files.

Requests for the config file without the hash directory is also checked to ensure that the request comes from a phone. If not, it adds to one of the fail2ban attempts increasing the likelihood of the IP being banned. The provisioning script also checks to see if the phone is "locked" for initial provisioning. The idea is that once a phone has been provisioned, it would know where to fetch the the config file. So we lock initial provisioning to prevent any other phone or device from attempting to auto provision. If you need to reprovision a phone, then there's an "unlock" button in the UI to enable initial provisioning for a phone. After 24 hours we lock initial provisioning if no phone triggers the lock.

>> Note: we have not enabled the "locking" feature on production servers yet.
