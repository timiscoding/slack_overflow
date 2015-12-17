# README

## Problem

Currently at General Assembly, the primary form of online communication is through slack chat. While it is a great tool to collaborate and for teachers to submit useful information and links, those resources get buried over time by general chat messages making it harder to find.

## Solution

Slack overflow is a forum intended for students and teachers at General Assembly where they can discuss course material, ask questions and post valuable resources where the most important information stays visible.

###Features:

* There are 4 different types of users, each inheriting all the privileges of those below them:
  * admin - delete posts, comments, users
  * teacher & student - update post, comment and their own profile. Vote up/down posts/comments
  * other - view forum. Doesn't require registration

* Post title and content keyword search

* Write post and comments in markdown with live HTML preview

## Demo

[Try it out now](https://slack-overflow-app.herokuapp.com/)

Several user accounts already exist:

Account type | User | password
:----- | :--- | :-----
admin | admin@gmail.com | chicken
student | vito@gmail.com | chicken
student | larry@gmail.com | chicken
student | mark@gmail.com | chicken

## Requirements

* ruby 2.2.3p173

* gem dependencies
  * elasticsearch-rails
  * elasticsearch-model
  * redcarpet
  * coderay
  * nokogiri
  * paloma
  * bcrypt
  * therubyracer
  * less-rails
  * twitter-bootstrap-rails

## Configuration

### Database creation

```
rake db:create
rake db:migrate
rake db:seed
```

## Deployment instructions

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