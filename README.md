# Acts As Favoritable

This plugin provides a simple way to track users favorites.

- Allow any model to be favorited.
- Allow any model to favorite. In other words, favoriter do not have to come from a user, they can come from any model (such as a Group or Team).
- Provide an easy to write/read syntax.

## Installation

### Rails 4+

Add this line to your application's Gemfile:

    gem 'acts_as_favoritable'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install acts_as_favoritable

### Database Migrations

    $ rails generate acts_as_favoritable:migration
    $ rake db:migrate

## Usage

### Favoritable Models


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
