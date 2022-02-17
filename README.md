# Trucking Exchange Network

Market platform for trucking capacity involving capacity providers and seekers.

React, SemanticUI, Ruby on Rails, Postgresql

While in development, run:
$ rails s
$ npm start --prefix client

Run this command to start the Postgres service:
$ sudo service postgresql start

Uses cities for origin/destination data from the Countries & Cities API here:
https://documenter.getpostman.com/view/1134062/T1LJjU52#01609797-37a7-49b4-91bb-4a4c81862797

To be implemented:
-add more destinations (slow load)
-search marketplace
-filter user page listings, calendar view
-include instructional landing page for first-time users
-market data dashboard
-add market making mechanism
-add completed transaction certification
