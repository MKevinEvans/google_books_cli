# Google Books Comand Line Application

## Usage Instructions

## Running this application

### you will need:

- A command line window
- Ruby 2.6.0 or greater installed
- RSpec installed (to run tests only)

## Instructions

#### 1. Clone this repopository and navigate into the folder

`$ git clone https://github.com/MKevinEvans/google_books_cli`
`$ cd google_books_cli`

#### 2. Run the Application with Ruby

`$ ruby app.rb`

## Description

The application will allow a user to search for books through the google books api.
For each search, users will receive basic information on 5 books and be given the option to add titles to a Reading List, which they can retrieve later in their session.

## Application Design

The majority of the application is comprised of many independent, or loosely dependent classes. These classes are then utilized in by the Session class, which itself is utilized in app.js.
A point some might see as contentious is the coupling of the classes Http_request and Response_adaptor. While this coupling might be seen to violate the principle of separation of concerns, my argument for implementing it in such a way is that the adaptor is inherently tied to the request, and thus functionally acts as an extension to it.
With the exception of classes using output (Session and Display_collection) all code was created through test-driven development.
