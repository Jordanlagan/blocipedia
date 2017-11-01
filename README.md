## Blocipedia
 
Blocipedia is a project I worked on during my Part Time Web Development course at Bloc.io. It is a wiki creation app, which allows users to create and edit their own and other people's wikis. 

Blocipedia presented many challenges to develop, such as user authentication and authorization, defining user roles and allowing users to purchase a premium membership, allowing premium users to create private wikis, rendering wikis in markdown, etc.

Blocipedia is deployed to heroku [here](https://protected-savannah-61068.herokuapp.com/)

### Features
 - Users can create a standard account in order to view, create, delete and edit Wikis.
 - Users can upgrade to a premium account by paying 15 dollars using Stripe.
 - Premium users can create private Wikis.
 - Wiki owners and admin users can add other users by email address as collaborators to private wikis.
 - Premium users can downgrade to a standard account (All private wikis will be made public).

### Setup and Configuration
 - Languages and Frameworks: Ruby on Rails and Bootstrap
 - Ruby version 2.4.1
 - Rails version 5.1.4
 - Databases: SQLite (Development), PostgreSQL (Production)

### Development Tools and Gems include:
 - Stripe (3.6.0) - For processing user payments during upgrade
 - Devise (4.3.0) - For user authentication
 - Pundit (1.1.0) - For user authorization
 - Friendly ID (5.1.0) - To render readable URLs
 - Faker (1.8.4) - To seed realistic user information during development
 - Redcarpet (3.4.0) - For rendering markdown in wikis
 - Mailcatcher (0.6.5)

### To run Blocipedia locally:
 - Clone the repository `git clone https://github.com/jordanlagan/blocipedia.git`
 - Run `bundle install`
 - Install `mailcatcher` or some other gem for catching sent emails in development
 - Create and migrate the SQLite database with `rails db:create` and `rails db:migrate`
 - Run the server `rails s`
 - Navigate in your browser to `127.0.0.1:1080` or wherever your mailcatching service started it's server
 - Follow the link for confirming the email address of 'test@example.com'
 - Enter email address 'test@example.com' and password 'helloworld' in your browser.
