# rails_chat_app

This is the framework for a functional chat room setup.



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
