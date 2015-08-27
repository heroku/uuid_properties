# UuidProperties

Generate UUIDs and find records using them on ActiveRecord models.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'uuid_properties'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install uuid_properties

## Usage

First, make sure there is a `uuid` attribute on your model and field on the corresponding table.

To add UUID generation and finders to a model, include the `UuidProperties` module:

```ruby
class User
  include UuidProperties
  ...
end
```

- Now whenever a record is created, it will have a UUID initialized (using `SecureRandom.uuid`).
- The presence of `uuid` on records is required to be valid
- You can also use the `find_by_uuid` and `find_by_uuid!` finders.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/heroku/uuid_properties. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
