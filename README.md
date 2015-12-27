# README

## Problem

Currently at General Assembly, the primary form of online communication is through slack chat. While it is a great tool to collaborate and for teachers to submit useful information and links, those resources get buried over time by general chat messages making it harder to find.

[Project Proposal](https://docs.google.com/presentation/d/1HWT0R8dTn3akpUkuyHaLjJ5UCalPNXmWz3L3Y7SDDt8/edit?usp=sharing)

## Solution

Slack overflow is a forum intended for students and teachers at General Assembly where they can discuss course material, ask questions and post valuable resources where the most important information stays visible.

[Model](https://drive.google.com/file/d/0B6JIIawp8JvsZWF5aUg5WDdhX3M/view?usp=sharing)

###Features:

* There are 4 different types of users, each inheriting all the privileges of those below them:
  * admin - delete posts, comments, users
  * teacher & student - update post, comment and their own profile. Vote up/down posts/comments
  * other - view forum. Doesn't require registration

* Post title and content keyword search

* Write post and comments in markdown with live HTML preview

* Code block syntax highlighting

[Project management](https://docs.google.com/spreadsheets/d/1fm6DrK3tP9h6d8XQxEvHuuvlaWYrqTgvSJExGRNU9k8/edit?usp=sharing)

## Demo

[Try it out now](https://slack-overflow-app.herokuapp.com/)

Several user accounts already exist:

Account type | User | password
:----- | :--- | :-----
admin | admin@gmail.com | chicken
student | vito@gmail.com | chicken
student | larry@gmail.com | chicken
student | mark@gmail.com | chicken

## Thanks

Jack for helping me with authentication and authorisation. Joel for helping me improve my model and introduce new techniques like callback hooks (before_save) and polymorphic associations. Ben helped me with how to use Nokogiri. Angie told me about the twitter bootstrap gem, saving me hours of css styling.

## Requirements

* ruby 2.2.3p173

* rails 4

* gem dependencies
  For forum post search:
  * [elasticsearch-rails](https://github.com/elastic/elasticsearch-rails/tree/master/elasticsearch-rails)
  * [elasticsearch-model](https://github.com/elastic/elasticsearch-rails/tree/master/elasticsearch-model)

  For server side markdown parsing
  * [redcarpet](https://github.com/vmg/redcarpet)

  For code block syntax highlighting:
  * [coderay](https://github.com/rubychan/coderay)
  * [nokogiri](https://github.com/sparklemotion/nokogiri)

  For page specific javascript:
  * [paloma](https://github.com/kbparagua/paloma)

  For password hashing:
  * [bcrypt](https://github.com/codahale/bcrypt-ruby)

  For styling:
  * [therubyracer](https://rubygems.org/gems/therubyracer/versions/0.12.2)
  * [less-rails](https://github.com/metaskills/less-rails)
  * [twitter-bootstrap-rails](https://github.com/seyhunak/twitter-bootstrap-rails)

* [remarkable jquery plugin](https://github.com/jonschlinkert/remarkable)

## Bugs

* Account registration lets users sign up as admin
* When making/editing a post/comment, live preview renders code blocks differently to the posted content. This is because 2 different parsers are used: remarkable jquery plugin for client side and redcarpet for server side
* live preview italicises when wrapping text with single underscores but after submitting, the text is underlined.
* After casting a vote, there is no way to undo the vote
* There is no difference between teacher and student accounts. The plan was to style comments/posts so students could easily spot their posts. I didn't have enough time to implement this.
* User pictures spill out of panel headers
* Going into your user profile causes a undefined controller error in console

## Configuration

### Database creation

```
rake db:create
rake db:migrate
rake db:seed
```

## Deployment instructions
Install then run the [postgresql server app](http://postgresapp.com/)

```
// install a local elasticsearch server
brew install elasticsearch
// run it
elasticsearch

// enter rails app debugger
ruby rails console
// inside it, create a new search index
Post.__elasticsearch__.create_index! force: true
// Build index on seeded data
Post.import

// run app
rails server

```