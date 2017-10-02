# Smart PBX Faxbox

Setting up for users to be able to send an email that will be delivered to a fax phone number.
Setting up for faxes to an account number to be delivered as an email to an email address.

> Who can use this feature?
> Faxing is available for all platforms including open-source.
> Management of fax/email settings is done by a reseller or account admin.
> Users can view their sent and received faxes in the user portal.

## What You Should Know


| Topic | Description |
| --- | --- |
| Receiving a fax | How a fax is sent to a user. |
| Set up user for faxing | How to configure a user to be able to send and receive faxes using their email. |
| Sending a fax | How a user needs to craft the email for email to fax. |
| User's Fax History | A user viewing their sent and received faxes. |


>> Keep in Mind for email to fax:
>> - Email from address must match the kazoo user's email address.
>> - Email to address is the destination number @ the account realm.
>> - Only the one attached PDF or Tiff file will be sent as the fax.


## Set up user for faxing

Setup with SmartPBX is very simple.

   1. Navigate to SmartPBX users.
   ![Users](users.png)

   2. Click the user's username in the User Settings column.
   ![User Settings](user_settings.png)

   3. In SmartPBX the user name is an email address. By default any notifications for the user, including inbound faxes will be sent to that email address. You can change the user's username/email address but that will change how they log in. You can use "Send emails to an alternate address" to change where notifications will be sent. This will also affect where email can come from for email to fax.
   ![Change Faxbox email address](faxbox_email_address.png)

   4. Click the user's Features and the Faxbox feature.
   ![Faxbox Feature](faxbox_feature.png)

   5. Click Enable
   ![Enable](enable_faxbox.png)

   6. Assign a number from spare numbers, purchasing a number, or creating a new extension. You can add multiple numbers or extensions.
   ![Assign Number](assign_number.png)

All set up.

>> Important: Using an extension for faxes from PSTN will not work without much effort on the part of the sender. Requires manual dialing to main number, listening to a menu prompt, dialing the extension, then telling the fax machine to start sending the fax.


## Receiving a Fax

Once the faxbox is set up, the only things that needs to be done is send a regular fax from a fax machine or fax service to the DID configured for the faxbox. Once successfully received an email will be sent to the user's email address with the fax attached as a PDF.
The received fax can also be seen in the Fax tab of the user portal. See User's Fax History below.
If an attempted inbound fax fails, an email notification will be sent to the faxbox owner's email address.

## Sending a Fax

The Faxbox feature configuration actually has all the info you need to know how to craft an email for sending a fax.
We will go through the info and expand on it.

1. Click the user's Features and the Faxbox feature.
   ![Faxbox Feature](faxbox_feature.png)

2. The user needs to create a new email from the email client they use for sending and receiving emails for the email address configured for the user, and is shown near the bottom of the faxbox config after "The email must come from".
   ![From Email](from_email.png)
3. The to email address needs to be made up of the following:
   ![From Email](from_email.png)
	1. The phone number the fax needs to be sent to. It must be at least 10 digits for a North American destination and the full international number for other locations and have a international indicator like 001 or +. It must not have non numeric characters other than a leading +.
	2. The @ symbol followed by the account's realm.

4. The "Show Help" at the bottom will allow you to enter a sample destination number to show how the To email address would be to send to that phone number.

5. Attach a PDF or TIFF file to the email.

6. Send the email.

>> Only attach 1 (one) PDF or TIFF. It will only send 1 attachment.
>> The subject and body of the email have no effect on the fax.

By default the user will be sent an email notification when/if the fax is successfully sent.
It will also show up in the user's User Portal, Fax tab. See User's Fax History below.
It the fax fails sending, a failure notification will be sent to the user's email address.

__Important if you manage carriers.__ Outbound fax calls are set with a "fax" flag and thus carriers that you want to be available for handling outbound fax calls must be configured with the "fax" flag. Caution, there is a "Require Flags" option which means that carrier will only handle calls with listed flags. This option you most likely do NOT want checked. If you see an error "no available resources" it is likely this flag is not configured on a carrier.


## User's Fax History

As mentioned in the above sections, all the user's faxes, both inbound and outbound can be seen in the User Portal, Fax tab.

![User Portal Faxes](user_portal_faxes.png)

The faxes can be downloaded.

Notice the date range filter. Some faxes may be filtered out that the user may be expecting to see.

Fax history is kept in the account's monthly databases. Availability is affected if the monthly database is deleted.
