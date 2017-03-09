# Fax Event Notifications

What fax events generate notifications.
Customize who gets the notification and the message for the event for the event type.

> Who can use this feature?
> Faxing notifications and customizations are available for all platforms including open source.
> The Branding App has a notification Template tool for customizing notifications including a WYSIWYG editor for customizing the body in html or text format of notification emails. The Branding App is available on Hosted Platform, Private Cloud and Global Infrastructure.

## What You Should Know


| Topic | Description |
| --- | --- |
| Notification Events | Fax Notification Templates and the events they are sent for.|
| Customizing Notifications | Basics of customizing the notifications. |


## Notification Events

Fax Notification Templates and the events they are sent for.

| Name | Description |
| --- | --- |
| Inbound Fax Received | The email sent with the fax attached when a inbound fax is successfully received. |
| Outbound Fax Sent | The email sent confirming the fax was successfully sent. |
| Inbound Fax Negotiation Error | The email sent when there is an error while receiving the fax. |
| Inbound Fax Receive Error | The email sent when there is a call to a faxbox but there are no fax tones from the originating caller. |
| Outbound Fax Error | The email sent when a fax fails to send. |

>> We found that calls from a source that is not a fax machine are common and would trigger an error email that caused the email recipient to think they missed a legitimate inbound fax when most of the time it was just a call from a marketing dialer. To separate and optionally disable those kinds of notifications we created the Inbound Fax Receive Error.

## Customizing Notifications
>>We will only cover the very basics here. For full documentation see the Branding App section of User Guides (when available).

### Inheritance

Customizations to a template including if it is enabled or disabled can be done on the account the fax will be handled by or any of it's parent account(s) up to it's reseller account.
The order a customization is looked for is from the account down to it's reseller account.
The first place a customization is found, those customizations are used.
By default there are no customization to any account and the templates will use system defaults for the notifications.

To remove any customizations at an account level:

 1. Masquerade as the account with account manager or account jump.
 2. Select the template you want to remove customizations for.
 3. Click "Reset to default" then Ok to confirm.

How to tell if a template is customized:

| Page icon color | Meaning |
| --- | --- |
| Green | It is customized and enabled at the current account level. |
| Red | It is disabled at the current account level. |
| Grey | There are no customizations at this level. |

When viewing a template that is not customized for the account it displays the system defaults, not any customizations that may be present from a parent or reseller account.
