# FareharborExternalApi

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/fareharbor_external_api`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fareharbor_external_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fareharbor_external_api

## Setup: Keys

#### Bash Profile

If you want to set your keys inside your bash profile:

    .bash_profile

    export FAREHARBOR_API_APP_KEY=<your_api_app_key>
    export FAREHARBOR_API_USER_KEY=<your_api_user_key>

Then in your command line, enter

    source ~/.bash_profile

#### Figaro

If you are using Figaro, follow the directions to set your keys [here.](https://github.com/laserlemon/figaro#example)

## Usage

### Paths

    All endpoints are rooted at https://fareharbor.com/api/external/v1/.

    GET /companies/
    GET /companies/<shortname>/lodgings/
    GET /companies/<shortname>/availabilities/<availability.pk>/lodgings/
    GET /companies/<shortname>/items/
    GET /companies/<shortname>/items/<item.pk>/availabilities/date/<date>/
    GET /companies/<shortname>/items/<item.pk>/availabilities/date-range/<start-date>/<end-date>/
    GET /companies/<shortname>/availabilities/<Availability.pk>/
    POST /companies/<shortname>/availabilities/<Availability.pk>/bookings/
    GET /companies/<shortname>/bookings/<Booking.uuid>/
    DELETE /companies/<shortname>/bookings/<Booking.uuid>/
    POST /companies/<shortname>/availabilities/<Availability.pk>/bookings/validate/

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/fareharbor_external_api.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
