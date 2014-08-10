SnailTracker
============
SnailTracker is a set of tools used to hunt down difficult bugs.

In Development
---------------
Snail Tracker is currently in early development, and is not ready for use on a production site yet.  We hope to have more soon


Why?
----
SnailTracker so you never have to say, "Sorry, I can't replicate that bug", ever again.

Setup
----
How does it work?  You simply need to:
1.  Setup the rails server on one of your servers (so you can access it publicly)
1.  Create an "app" for each app you would like to track
1.  Install the [client JS library](https://github.com/snailtracker/snailtracker-js) on each web application you would like to track, and provide the app's API Key.
1.  Install the server library (for [rails](https://github.com/snailtracker/snailtracker-rails) or [PHP](https://github.com/snailtracker/snailtracker-php) ) on your server, and set your app's API Key.
1.  Track down bugs by viewing your user's activity.



License
-------
AGPL
