# Snapuser

A rails engine to add a simple authentification and permission system.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'snapuser'
```

And then execute:

    $ bundle

In order to run the engine's migrations:

    $ rake db:migrate

## Usage

TODO

## Configuration

You can configure the different permission's levels.

Create an initializer and set `Snapuser.levels` with an hash:

```ruby
# initializers/snapuser.rb

Snapuser.levels = {"superadmin" => "1", "admin" => "2", "leader" => "3", "uploader" => "4", "member" => "5"}
```
By default, the levels are `{"superadmin" => "1", "admin" => "2"}`.