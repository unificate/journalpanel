# Micromanage
A mountable engine that exposes a RESTful API for selected tables in a
Microservice. Micromanage is being developed alongside Panel, a Ruby on Rails
web application, to allow for the easy management of databases in multiple
Microservices.

## Usage
Micromanage does not add any functionallity accessible in the Microservice
itself. It exposes the following API endpoints:

```ruby
# retrieve all tables the Microservice has exposed
get  /

# retrieve all records from a table
GET  /table

# update a record in a table
PUT  /table/row

# add a new record to a table
POST  /table
```

Micromanage does not provide an endpoint to delete a record from a table.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'micromanage'
```

Create the file config/initializers/micromange.rb in your application with
the following:

```ruby
Micromanage.setup do |config|
  config.tables = ["tablename"]
end
```

Replacing tablename with a list of tables you would like to expose.

And then execute:
```bash
$ bundle
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
