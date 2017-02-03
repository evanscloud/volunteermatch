# The VolunteerMatch Public-Use API Gem

VolunteerMatch is a lightweight Ruby wrapper that queries VolunteerMatch's Public-Use API for searching information on nonprofit organizations and active volunteering opportunities. 

This gem is inspired by the Ruby api example provided in [vm-contrib repo](https://github.com/volunteermatch/vm-contrib). Queries are configured based on the attributes applied and return a collection of JSON results. 

The Official documentation on using the API can be found at [VolunteerMatch.org](http://cdn.volunteermatch.org/www/legal/VM-Public-use-API-user-manual.pdf).

### Before Continuing

To use VolunteerMatch's Public-Use API, you need to be validated for full access. Complete an online application [here](https://www.volunteermatch.org/legal/publicuseapi) in order to get approved for a unique Public-Use key. Until then, you are only able to test `helloWorld` calls.

## Getting Started

Add this line to your application's Gemfile:

```ruby
gem 'volunteermatch'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install volunteermatch

## API Access Agreement

All data obtained through this gem belongs to VolunteerMatch. Please review the [Public-Use API Access Agreement](http://cdn.volunteermatch.org/www/legal/Public-Use%20API%20Access%20Agreement.pdf) for all terms, limitations and restrictions.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Suggestions, bug reports and pull requests are encouraged for those who would like to take part in improving this gem. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org).

## License

Copyright (c) 2017, Evan Ng

The VolunteerMatch gem is available as open source under the terms of the [MIT license](https://opensource.org/licenses/MIT).