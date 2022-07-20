# makers_bnb
This is week 7 of the software engineer bootcamp.

This week is an exercise where we work in a team environment and build a project to specification.

We would like a web application that allows users to list spaces they have available, and to hire spaces for the night.

## Headline specifications
* Any signed-up user can list a new space.
* Users can list multiple spaces.
* Users should be able to name their space, provide a short description of the space, and a price per night.
* Users should be able to offer a range of dates where their space is available.
* Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
* Nights for which a space has already been booked should not be available for users to book that space.
* Until a user has confirmed a booking request, that space can still be booked for that night.
## Nice-to-haves
Users should receive an email whenever one of the following happens:
* They sign up
* They create a space
* They update a space
* A user requests to book their space
* They confirm a request
* They request to book a space
* Their request to book a space is confirmed
* Their request to book a space is denied

Users should receive a text message to a provided number whenever one of the following happens:
* A user requests to book their space
* Their request to book a space is confirmed
* Their request to book a space is denied

A ‘chat’ functionality once a space has been booked, allowing users whose space-booking request has been confirmed to chat with the user that owns that space

Basic payment implementation though Stripe.

 <details>
<summary>User Stories</summary>
<br>
As a prospective user,<br>
So that I can use the service,<br>
I want to be able to create an account by signing up to the service.<br>
<br>
As a signed up user,<br>
So that I can advertise my property,<br>
I want to be able to add my property to the website.<br>
<br>

As a user,<br>
In order to rent out more than one property,<br>
I want to be able to list multiple properties on the website.<br>
<br>
As a user,<br>
So that my property is easily identified,<br>
I want to be able to give my property a name.<br>
<br>
As a user,<br>
So that customers know about my property,<br>
I want to be able to give a short description of my property.<br>
<br>
As a user,<br>
So that customers know how much the fee is to hire,<br>
I want to be able to list a price per night.<br>
<br>
As an owner of a space<br>
To allow bookers to view up to date availability<br>
I want to be able to show a calendar of availability<br>
<br>
As a signed-up user<br>
To let an owner know I’m interested in hiring their space,<br>
I want to be able to send a request for any space for one night<br>
<br>
As an owner<br>
To know when someone is interested in booking my space<br>
I want to receive requests from signed-up users<br>
<br>
As an owner<br>
To have control over who stays in my space<br>
I want to approve bookings before they are confirmed<br>
<br>
As a MakersBnb user<br>
So that I know when a space is unavailable<br>
The dates when a space is unavailable should be displayed<br>
<br>
‌As a MakersBnb user<br>
So that I don’t try to double book a space<br>
Booked spaces should not be available to book<br>
<br>
‌As a MakersBnb host<br>
So that bookings for my space don’t overlap<br>
My space should be unavailable to other users for date range where it’s already been booked<br>
<br>
As a MakersBnb host<br>
So that booking requests are maximised<br>
My space should only be unlisted for a given date range when a booking has been confirmed<br>

</details>

## Getting started

```
git clone https://github.com/KevinByrne/makers_bnb.git
```

To setup the database:

* Connect to psql
* Create the database using the psql command `CREATE DATABASE makersbnb;`
* Connect to the database using the psql command `\c makersbnb`
* Run the query saved in 01_create_spaces_table.sql
* Run the query saved in add_availability_column.sql

To setup the test database:
* Connect to psql
* Create the database using the psql command `CREATE DATABASE makersbnb_test;`
* Connect to the database using the psql command `\c makersbnb_test`
* Run the query saved in 01_create_spaces_table.sql
* Run the query saved in add_availability_column.sql


```
bundle install
```

## Usage

```
rackup
```

Navigate to `http://localhost:9292/`

## Running tests

```
rspec
```
