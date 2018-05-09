# Fakebook

Facebook implementation built on Ruby on Rails.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 

### Prerequisites

This project runs on [Ruby](https://www.ruby-lang.org/en/documentation/installation/), and [Rails](http://installrails.com/)

After installation, run `ruby -v` to make sure Ruby installed correctly. Example
```
$ ruby -v
ruby 2.3.0p0 (2015-12-25 revision 53290) [x86_64-darwin17]
```

Also make sure that Rails is installed, but running `rails -v`. 
Example
```
$ rails -v
Rails 5.1.6
```

### Installing

Run `bundle install` to install all project dependencies.

### Serve Project

Run the server with the following command:

```
rails s
```

Once its running, head over to your browser to [see Fakebook](http://localhost:3000/).


### Running Tests

To run the project tests, run the following command:
```
rspec -f D
```

### Deploy on Heroku

You can deploy the project on [Heroku](https://www.heroku.com/) using the following steps:

1. Create a Heroku Account
2. On the terminal, run `heroku create` to create a new app
3. Run `heroku push` to start a deployment on Heroku.
4. Run `heroku migrate` to run migrations on your production database.
5. Visit your project URL as assigned by Heroku to see a live deployment of Fakebook.

### Docker

Build the project

`$ docker-compose build`

Create the database:
`$ docker-compose run --rm web bin/rails db:create`

Run the migrations:
`$ docker-compose run --rm web bin/rails db:migrate`

Run the app:
`$ docker-compose up -d`


## Authors

* **Kevin Wahome** - [talihomz](https://github.com/talihomz)
* **Sava Vuckovic** - [savavuckovic](https://github.com/savavuckovic)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
