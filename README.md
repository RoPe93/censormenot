SUMMARY
-------

CensorMeNot is a decentralized, censorship-resilient, cooperative service for looking up IP addresses of Internet domains the DNS records of which have been abusively tampered with by the ICANN at the behest of malicious organizations.

[This](http://static.arstechnica.com/12-20-2010/ICE-seized.jpg) is what I mean. Whenever you see that banner on your favorite website, it's already too late. There is no way at that point to find out what IP address the domain used to have, so that you could perhaps associate it manually in your hosts file.

As a result of the seizure, the targeted site's traffic instantly drops to zero and stays there, consequently there is no longer any incentive for the site's owner to continue to keep the site up and running, and so the malicious organizations have won.

CensorMeNot aims to be your mechanism of choice for preemptively storing DNS lookups ahead of time, while your favorite websites are still alive. This information is carefully propagated between participating nodes on the Internet using the principles of peer-to-peer (P2P) networks.

At the present time, CensorMeNot's architecture consists of four major components:

* browser-based, local search functionality (implemented), the ability to query your locally stored, trusted database;
* dataset sharing (implemented), the ability to let other peers retrieve a copy of your entire database (in JSON format);
* peer discovery (implemented);
* smart/safe sync of the local database with previously discovered peers (feature not yet implemented), the ability to leverage IP address blacklists which are actively being maintained to support users of the popular PeerGuardian software.

CensorMeNot is written in Ruby on Rails and is currently at the prototype stage.

License: [Affero GPL](http://www.gnu.org/licenses/agpl.html).
