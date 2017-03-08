# Failover
This is a guide on how Provisioner handles failover across all devices. Here we go over the basics of failover, our preferred method of handling failover and why we have chosen to handle failover that way.

> Who can use this feature?
> Administrators who are deploying phones hooked up to our provisioning service.

## Intro
Failover is used to handle media server failures to ensure calls can be made as long as one media server is up. Our prefered method of handling failover is to use SRV records.
For Hosted Partners or system admins, Provisioner is setup by default to use SRV records and our built in GeoIP feature will attempt to determine the closest outbound proxy to use. See [GeoIP](../geoip/geoip.md) for more information.
For Private Cloud and Global Infrastructure, you will need to have multiple SRV records setup for the different priorities of your media servers based on your zones.
## Transport Type
Provisioner prefers the use of DNS/NAPTR to provide devices with failover. In the global level of settings, the transport is set to DNS/NAPTR. While it is not a transport type, majority of phones have it set as a transport type to let the user know that by choosing DNS/NAPTR, the proxy will determine the transport type through the SRV Record on the server. Unlike an A Record which only sets the Name, TTL and Address of a server, with a SRV Record, we can set the Transport Protocol, Priority, Weight and Port in addition to the former three. This allows a single point that contains all the failover information.
## Outbound Proxy Address and Port settings
On our hosted provisioner service, we have three different outbound proxies available for three zones ([East](us-east.p.zswitch.net), [West](us-west.p.zswitch.net) and [Central](us-central.p.zswitch.net)). Those can be white labeled for our Hosted Partners. 
For Private Cloud and Global Infrastructure clients, you would need to give us a list of your zones for us to add to your cluster level settings. This step would be done as part of setting up [GeoIP](../geoip/geoip.md) during intial setup of Provisioner for your cluster.
The port needs to be 0 for SRV records to work. It is a requirement for some phones to work. Also, the SRV records would contain the transport type to use (UDP, TCP, etc.) and port. Provisioner will force the port to be 0 on the backend if the transport type selected in the UI is DNS/NAPTR.
>> Note: We do not set the second outbound proxy as the SRV record would handle it.
## SRV record
A SRV record has the form:
```
_service._proto.name. TTL class SRV priority weight port target.
```
    - _service_: the symbolic name of the desired service.
    - _proto_: the transport protocol of the desired service; this is usually either TCP or UDP.
    - _name_: the domain name for which this record is valid, ending in a dot.
    - _TTL_: standard DNS time to live field.
    - _class_: standard DNS class field (this is always IN).
    - _priority_: the priority of the target host, lower value means more preferred.
    - _weight_: A relative weight for records with the same priority, higher value means more preferred.
    - _port_: the TCP or UDP port on which the service is to be found.
    - _target_: the canonical hostname of the machine providing the service, ending in a dot.
## Why SRV records and settings
We have noticed on some phones that setting Primary and Secondary Proxies the phone will alternate between the two as a way of load balancing instead of using the Secondary Proxy only for failover. This has cause some issues due to the phone making requests to a further server 50% of the time.
SRV records also provides a way of managing media server IPs in one place. If the IP of our media servers change, then we would just need to update the SRV record without having to update Provisioner templates with the new information. This also gives us the ability to add more than one media server for failover. 
## Failover in use through SRV records
(images/failover-diagram.png)
In the example above, the SIP Device A is connected to an Outbound Proxy A set up by Provisioner. The Outbound Proxy contains a SRV Record with priority from left to right. The SIP Device A then attempts to connect to Media Server 1. If Media Server 1 is down, then it tries Media Server 2 and last Media Server 3.

A second SIP Device B can be similarly set up to a second Outbound Proxy B where the priority of Media Servers goes from right to left. So SIP Device B would try Media Server 3, then Media Server 2 and last Media Server 1.
