# makers_bnb
This is week 7 of the software engineer bootcamp.

This week is an exercise where we work in a team environment and build a project to specification.

We would like a web application that allows users to list spaces they have available, and to hire spaces for the night.

## Headline specifications
 - Any signed-up user can list a new space.
 - Users can list multiple spaces.
 - Users should be able to name their space, provide a short description of the space, and a price per night.
 - Users should be able to offer a range of dates where their space is available.
 - Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
 - Nights for which a space has already been booked should not be available for users to book that space.
 - Until a user has confirmed a booking request, that space can still be booked for that night.
## Nice-to-haves
Users should receive an email whenever one of the following happens:
 - They sign up
 - They create a space
 - They update a space
 - A user requests to book their space
 - They confirm a request
 - They request to book a space
 - Their request to book a space is confirmed
 - Their request to book a space is denied
Users should receive a text message to a provided number whenever one of the following happens:
 - A user requests to book their space
 - Their request to book a space is confirmed
 - Their request to book a space is denied
 - A ‘chat’ functionality once a space has been booked, allowing users whose space-booking request has been confirmed to chat with the user that owns that space
 - Basic payment implementation though Stripe.

 <details>
<summary>User Stories</summary>
<br>
As a prospective user,
So that I can use the service,
I want to be able to create an account by signing up to the service.

As a signed up user,
So that I can advertise my property,
I want to be able to add my property to the website.

As a User,
In order to rent out more than one property,
I want to be able to list multiple properties on the website.

As a User,
So that my property is easily identified,
I want to be able to give my property a name.

As a User,
So that customers know about my property,
I want to be able to give a short description of my property.

As a User,
So that customers know how much the fee is to hire,
I want to be able to list a price per night.
</details>
