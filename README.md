<h2>SUMMARY</h2>

CensorMeNot is a decentralized, censorship-resilient, cooperative service for looking up IP addresses of Internet domains the DNS records of which have been abusively tampered with by the ICANN at the behest of malicious organizations.

[This](http://static.arstechnica.com/12-20-2010/ICE-seized.jpg) is what I mean. Whenever you see that banner on your favorite website, it's already too late. There is no way at that point to find out what IP address the domain used to have, so that you could perhaps associate it manually in your hosts file.

As a result of the seizure, the targeted site's traffic instantly drops to zero and stays there, consequently there is no longer any incentive for the site's owner to continue to keep the site up and running, and so the malicious organizations have won.

CensorMeNot aims to be your mechanism of choice for preemptively storing DNS lookups ahead of time, while your favorite websites are still alive. This information is carefully propagated between participating nodes on the Internet using the principles of peer-to-peer (P2P) networks.

At the present time, CensorMeNot's architecture consists of four major components:

* browser-based, local search functionality (implemented), the ability to query your locally stored, trusted database;
* dataset sharing (implemented), the ability to let other peers retrieve a copy of your entire database (in JSON format). This feature will be obsoleted in favor of a multicast-based approach;
* peer discovery (it is implemented although somewhat inefficient);
* smart/safe sync of the local database with previously discovered peers (feature not yet implemented), the ability to leverage IP address blacklists which are actively being maintained to support users of the popular PeerGuardian software.

CensorMeNot is written in Ruby on Rails and is currently at the prototype stage.

License: [Affero GPL](http://www.gnu.org/licenses/agpl.html).

A live presentation of CensorMeNot (in Romanian language) can be seen [here](http://www.youtube.com/watch?v=YNZDhPIdaho).

<h2>Installation (DEB-based Linux distributions)</h2>

<strong>Is your DPKG package database up to date?</strong>

<code>sudo aptitude update</code>

<strong>We need some *-dev packages:</strong>

<code>sudo aptitude install zlib1g-dev libsqlite3-dev</code>

<strong>Install RVM (visit [the RVM site](http://beginrescueend.com/rvm/install/) for reference, but do follow the instructions below):</strong>

<code>bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)</code>

<strong>Using your favorite text editor, append the line below to the end of your ~/.bashrc:</strong>

<code>[[ -s ~/.rvm/scripts/rvm ]] && . ~/.rvm/scripts/rvm</code>

<strong>Close the terminal session you're in, open a new one.</strong>

<strong>Install the version of openssl required by RVM (this process takes a while, please be patient):</strong>

<code>rvm pkg install openssl</code>

<strong>Install Ruby version 1.9.2, including binding for openssl (this process takes a while, please be patient):</strong>

<code>rvm install 1.9.2 -C --with-openssl-dir=~/.rvm/usr</code>

<strong>Set your preference for version 1.9.2 of Ruby:</strong>

<code>rvm --default use 1.9.2</code>

<strong>Install the latest version of Rails and the Rufus scheduler (this process takes a while, please be patient):</strong>

<code>gem install --no-ri --no-rdoc rails rufus-scheduler</code>

<strong>Double-check Rails has been installed correctly:</strong>

<code>rails -v</code>

<strong>Grab the latest copy of CensorMeNot:</strong>

<code>git clone https://github.com/dserban/censormenot.git</code>

<strong>Install bundles, sync the database and start the server:</strong>

<code>cd censormenot</code>

<code>bundle install</code>

<code>rake db:migrate</code>

<code>rails s</code>

<strong>Open your browser and visit [http://localhost:3000/](http://localhost:3000/)</strong>

