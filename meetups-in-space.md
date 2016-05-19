#Meetup.com Clone Site

In order to practice more with Sinatra, I built this project as a rough clone of [Meetup.com](http://www.meetup.com/). The site allows users to sign up, join existing meetings, and even create their own meetup.

This project allowed me to practice:
* Effectively structuring data to minimize duplication
* Modeling connections between information using one-to-many and many-to-many relationships
* Using ActiveRecord to associate tables
* Retrieving information from a database using ActiveRecord
* Using ActiveRecord validations at both the database and model level

###ER Diagram
![]()

###Technologies Utilized
* OAuth

###User Stories

```no-highlight
As a user
I want to view a list of all available meetups
So that I can get together with people with similar interests
```
**Acceptance Criteria:**
* On the meetups index page, I should see the name of each meetup.
* Meetups should be listed alphabetically.

```no-highlight
As a user
I want to view the details of a meetup
So that I can learn more about its purpose
```
**Acceptance Criteria:**
* On the index page, the name of each meetup should be a link to the meetup's show page.
* On the show page, I should see the name, description, location, and the creator of the meetup.

```no-highlight
As a user
I want to create a meetup
So that I can gather a group of people to do an activity
```
**Acceptance Criteria:**
* There should be a link from the meetups index page that takes you to the meetups new page. On this page there is a form to create a new meetup.
* I must be signed in, and I must supply a name, location, and description.
* If the form submission is successful, I should be brought to the meetup's show page, and I should see a message that lets me know that I have created a meetup successfully.
* If the form submission is unsuccessful, I should remain on the meetups new page, and I should see error messages explaining why the form submission was unsuccessful. The form should be pre-filled with the values that were provided when the form was submitted.

```no-highlight
As a user
I want to see who has already joined a meetup
So that I can see if any of my friends have joined
```
**Acceptance Criteria:**
* On a meetup's show page, I should see a list of the members that have joined the meetup.
* I should see each member's avatar and username.

```no-highlight
As a user
I want to join a meetup
So that I can partake in this meetup
```
**Acceptance Criteria:**
* On a meetup's show page, there should be a button to join the meetup if I am not signed in or if I am signed in, but I am not a member of the meetup.
* If I am signed in and I click the button, I should see a message that says that I have joined the meetup and I should be added to the meetup's members list.
* If I am not signed in and I click the button, I should see a message which says that I must sign in.

