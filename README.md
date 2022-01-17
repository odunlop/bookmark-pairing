# Bookmark Pairing Challenge
An exercise is learning how to incorporate databases into our projects as well as consolidating last week's learning on 'The Web'.

## User Stories
```
As a user,
So that I can easily navigate to my most used websites,
I want to see a list of bookmarked websites

As a time-pressed user
So that I can save a website
I would like to add the site's address and title to bookmark manager
```
## Domain Model
The below is a rough domain model of the first user story, completed before any coding was done.
![A screenshot of the domain model for the first user story](./assets/Model.png)

## To set up the database
Connet to 'psql' and create the `bookmark_manager` database:
```
CREATE DATABASE bookmark_manager;
```
To set up appropriate tables, connect to the databse in `psql` and run the SQL scripts in the 'db/migrations' folder in the givne order.