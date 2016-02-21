# README

## Problem

Currently at General Assembly, the primary form of online communication is through slack chat. While it is a great tool to collaborate and for teachers to submit useful information and links, those resources get buried over time by general chat messages making it harder to find.

[Project Proposal](https://docs.google.com/presentation/d/1HWT0R8dTn3akpUkuyHaLjJ5UCalPNXmWz3L3Y7SDDt8/edit?usp=sharing)

## Solution

Slack overflow is a forum intended for students and teachers at General Assembly where they can discuss course material, ask questions and post valuable resources where the most important information stays visible.

[Model](https://drive.google.com/file/d/0B6JIIawp8JvsZWF5aUg5WDdhX3M/view?usp=sharing)

## Features:

* There are 4 different types of users, each inheriting all the privileges of those below them:
  * admin - delete posts, comments, users
  * teacher & student - update post, comment and their own profile. Vote up/down posts/comments
  * other - view forum. Doesn't require registration

* Post title and content keyword search

* Write post and comments in markdown with live HTML preview

* Code block syntax highlighting

[Project management](https://docs.google.com/spreadsheets/d/1fm6DrK3tP9h6d8XQxEvHuuvlaWYrqTgvSJExGRNU9k8/edit?usp=sharing)

## Updates since project deadline

To preserve the work I accomplished during project week, I have created a new branch called `extra`. These are the updates I have implemented during my free time:

Implemented Jack's (GA instructor) feedback:
* refactored live preview javascript
* moved 3rd party css to vendor/assets folder
* bootstrap styling was using LESS css preprocessor. They have been replaced with plain css. Rails uses SASS by default so it makes sense to stick with one.
* voting actions have been abstracted into a controller concern
* styling has been cleaned up
* timestamps more human readable

New updates
* Votes are updated via AJAX with HTML fallback
* Users can undo a vote by clicking their previous vote button
* Vote buttons change to green when a vote has been cast
* When making a post, it is automatically upvoted by the author
* Post and comment editor styling looks better
* Fixed picture overflowing panel header
* Markdown conversion used to be done on client and server side. Now it's all done in-browser. Live preview and showing post/comment now renders the output.
* Fixed bug where live preview stopped working after refreshing the new post/comment page
* Styling for post/comment/preview more consistent
* Fixed new comments being inserted in the wrong order
* Post index shows newest posts first
* markdown help when making new post/comment

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
  * [elasticsearch-rails](https://github.com/elastic/elasticsearch-rails/tree/master/elasticsearch-rails)
  * [elasticsearch-model](https://github.com/elastic/elasticsearch-rails/tree/master/elasticsearch-model)
  * ~~[redcarpet](https://github.com/vmg/redcarpet)~~ replaced with [markdown-it](https://github.com/markdown-it/markdown-it)
  * ~~[coderay](https://github.com/rubychan/coderay)~~ replaced with [highlight.js](https://highlightjs.org/)
  * ~~[nokogiri](https://github.com/sparklemotion/nokogiri)~~ used this with coderay
  * [paloma](https://github.com/kbparagua/paloma)
  * [bcrypt](https://github.com/codahale/bcrypt-ruby)
  * [twitter-bootstrap-rails](https://github.com/seyhunak/twitter-bootstrap-rails)

* ~~[remarkable jquery plugin](https://github.com/jonschlinkert/remarkable)~~ replaced

## Bugs

* Account registration lets users sign up as admin
* There is no difference between teacher and student accounts. The plan was to style comments/posts so students could easily spot their posts. I didn't have enough time to implement this.
* Going into your user profile causes a undefined controller error in console
* Undefined controller in console when refreshing a post
* toggling between up down votes causes buttons to turn into links

## To-do

* Users can filter post index by date, votes
* Allow user to specify language in fenced code block. Currently, it is auto detected and does an ok job. To get line numbering working, I used an implementation by highlight.js author in an older experimental branch. Need to merge the branch into master which enables manually choosing language.

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