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

The gem provides two methods to securize your controllers and your views.

Use `authorize_level(level)` to prevent access to an action from a certain user level. In this example, only the users with a level 2 or higher can visit these pages.

```ruby
class Admin::EventsController < Admin::BaseController
  before_action { |c| c.authorize_level(3) }

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    ...
  end

end
```

Use `authorize_level?(level)` to know if a user is authorized compared to a given level.

```html
<%= link_to "Add an event", new_event_path if authorize_level?(3) %>
```

Finally, if you just want that a user is connected, use the first method with your lowest level.

## Configuration

You can configure the different permission's levels.

Create an initializer and set `Snapuser.levels` with an hash:

```ruby
# initializers/snapuser.rb

Snapuser.levels = {"superadmin" => "1", "admin" => "2", "leader" => "3", "uploader" => "4", "member" => "5"}
```
By default, the levels are `{"superadmin" => "1", "admin" => "2"}`.