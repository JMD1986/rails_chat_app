# rails_chat_app

##This is the framework for a functional chat room setup.

This is the backend framework. To see the frontend go to http://sydneyjlindsay.github.io/


It contains pages of raw JSON values for easy information retrieval.

##features

*easily scalable code that makes creating new rooms as simple as typing /newroom

*profile pages that can be accessed via profile/username

*stats section that includes most popular rooms, number of posts, most active users, and total user posts.

*list of users that have posted within the last four hours

*default showing of only posts from the last five minutes

This program is currently hosted on Heroku at

https://agile-plateau-2979.herokuapp.com

a board showing the process for creating both the front and back end is available here

https://trello.com/b/8s7wyHAf/chat-room

a hackpad with various information is at chatapp.hackpad.com

```
.
├── Gemfile
├── Gemfile.lock
├── Procfile
├── README.md
├── README.rdoc
├── Rakefile
├── app
│   ├── assets
│   │   ├── images
│   │   ├── javascripts
│   │   │   ├── application.js
│   │   │   └── message.coffee
│   │   └── stylesheets
│   │       ├── application.css
│   │       └── message.scss
│   ├── controllers
│   │   ├── application_controller.rb
│   │   ├── concerns
│   │   └── message_controller.rb
│   ├── helpers
│   │   ├── application_helper.rb
│   │   └── message_helper.rb
│   ├── mailers
│   ├── models
│   │   ├── concerns
│   │   └── message.rb
│   └── views
│       ├── layouts
│       │   └── application.html.erb
│       └── message
├── bin
│   ├── bundle
│   ├── rails
│   ├── rake
│   ├── setup
│   └── spring
├── config
│   ├── application.rb
│   ├── boot.rb
│   ├── database.yml
│   ├── en.yml
│   ├── environment.rb
│   ├── environments
│   │   ├── development.rb
│   │   ├── production.rb
│   │   └── test.rb
│   ├── initializers
│   │   ├── assets.rb
│   │   ├── backtrace_silencers.rb
│   │   ├── cookies_serializer.rb
│   │   ├── filter_parameter_logging.rb
│   │   ├── inflections.rb
│   │   ├── mime_types.rb
│   │   ├── session_store.rb
│   │   └── wrap_parameters.rb
│   ├── locales
│   │   └── en.yml
│   ├── routes.rb
│   └── secrets.yml
├── config.ru
├── db
│   ├── development.sqlite3
│   ├── migrate
│   │   └── 20150604190720_create_message.rb
│   ├── schema.rb
│   └── seeds.rb
├── lib
│   ├── assets
│   └── tasks
├── log
│   └── development.log
├── public
│   ├── 404.html
│   ├── 422.html
│   ├── 500.html
│   ├── favicon.ico
│   └── robots.txt
├── test
│   ├── controllers
│   │   └── message_controller_test.rb
│   ├── fixtures
│   │   └── messages.yml
│   ├── helpers
│   ├── integration
│   ├── mailers
│   ├── models
│   │   └── message_test.rb
│   └── test_helper.rb
├── tmp
│   ├── cache
│   │   └── assets
│   ├── pids
│   │   └── server.pid
│   ├── sessions
│   └── sockets
└── vendor
    └── assets
        ├── javascripts
        └── stylesheets
```
