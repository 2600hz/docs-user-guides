Tell me how to manage my carriers, create account local carriers, maybe dabble with `fs_path`?

I have got no clue as to FS_path

But ...


Carriers in this context are trunks / trunk providers, but in VoiP everybody calls everything exactly how they want, and so do we. 
A carrier is the connection to an external provider used to place calls to the outside world.
The kazoo project sometimes uses the same term for number providers, so its a bit confusing if ur not dealing with this everyday.

There are many such providers, and u just have to choose one or mmore and add them to the system.

So then:
1. a master account can have a carrier specified, and we refer to it as the global carrier
2. an reseller account can also set its own carrier, a subaccount would see it as a partner carrier
3. an account can set its own carrier


Taken from https://www.powerpbx.org/content/kazoo-v4-single-server-install-guide-v1

SIP Trunks/Carriers
SIP trunks can be global or local.  Global trunks are added to the offnet database and are accessible by all accounts.  Local trunks are added to each account.

Monster UI does not currently have a public app for managing SIP trunks.  
However, it is still possible to use the discontinued Kazoo UI in parallel for adding local trunks. 

Create an outbound carrier

for the tech savy, 
and this example user username and password authentication with your trunk provider
This also assumes you have an upstream carrier that uses username/password to authenticate your calls.

# Create a "resource" representing the carrier
# "rules" is a list of regexes to match numbers for this carrier
# "gateways" is a list of JSON objects representing the gateway(s) to use
curl -X PUT -H "X-Auth-Token: $AUTH_TOKEN" \
     -d '{"data":{"rules":[".{5,}"],"name":"Carrier Foo","gateways":[{"realm":"sip.carrier.com","server":"sip.carrier.com","username":"your_username","password":"your_password","enabled":true}]}}' \
     http://ip.add.re.ss:8000/v2/accounts/$ACCOUNT_ID/resources | python -mjson.tool

# capture the id of the resource
export RESOURCE_ID="{RESOURCE_ID}"

# Now create a callflow to use this account resource
# This uses the "no_match" special number
curl -X PUT -H "X-Auth-Token: $AUTH_TOKEN" \
     -d '{"data":{"name":"Offnet Callflow","numbers":["no_match"],"flow":{"module":"resources","data":{"use_local_resources":true}}}}' \
     http://ip.add.re.ss:8000/v2/accounts/$ACCOUNT_ID/callflows | python -mjson.tool
     
how to create a global offnet carrier using IP Auth instead of username / password?:you do it the same way but just leave out 
the username/password fields.



