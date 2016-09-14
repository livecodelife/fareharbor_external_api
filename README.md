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

To get started with the FareHarbor External API Gem, you will need to request access keys from FareHarbor. Please contact <support@fareharbor.com> to request access to the FareHarbor External API.

#### Bash Profile

If you want to set your keys inside your bash profile:

    .bash_profile

    export FAREHARBOR_API_APP_KEY=<your_api_app_key>
    export FAREHARBOR_API_USER_KEY=<your_api_user_key>

Then in your command line, enter

    source ~/.bash_profile

#### Figaro

If you are using Figaro, follow the directions to set your keys [here.](https://github.com/laserlemon/figaro#example)

In your application.yml file, set your keys like this:

FAREHARBOR_API_APP_KEY=<your_api_app_key>
FAREHARBOR_API_USER_KEY=<your_api_user_key>

Make sure you add application.yml to your .gitignore file to keep your keys hidden

## Usage

After installing the gem and setting your keys, you can access specific endpoint data by calling `FareHarbor::Affiliate::Company.<specify method here>`

For ease of use, it is recommended that you save the above class as a variable.

`affiliate = FareHarbor::Affiliate::Company`

Now you can call the specified endpoint methods on the affiliate variable. For example:

`affiliate.items(company_shortname: <your company shortname here>)`

Is the equivalent of:

`FareHarbor::Affiliate::Company.items(company_shortname: <your company shortname here>)`


### Paths

All endpoints are rooted at `https://fareharbor.com/api/external/v1/`.

Use the methods below to access JSON data corresponding with each endpoint:

`GET /companies/`

Returns a list of all companies for which you have permission to create bookings;
note that this may include companies that have no bookable availabilities.

Returns an array of `Company` objects.

Example method:

    `FareHarbor::Affiliate::Company.all`

Example response:

    {
      "companies": [
        {
          "shortname": "hawaiianadventures",
          "name": "Hawaiian Adventures"
        }, {
          "shortname": "surflessonshawaii",
          "name": "Surf Lessons Hawaii"
        }
      ]
    }

    GET /companies/<shortname>/lodgings/
    FareHarbor::Affiliate::Company.lodgings

    GET /companies/<shortname>/availabilities/<availability.pk>/lodgings/
    FareHarbor::Affiliate::Company.availability_lodgings

    GET /companies/<shortname>/items/
    FareHarbor::Affiliate::Company.items

    GET /companies/<shortname>/items/<item.pk>/availabilities/date/<date>/
    FareHarbor::Affiliate::Company.availabilities_by_date

    GET /companies/<shortname>/items/<item.pk>/availabilities/date-range/<start-date>/<end-date>/
    FareHarbor::Affiliate::Company.availabilities_by_date_range

    GET /companies/<shortname>/availabilities/<Availability.pk>/
    FareHarbor::Affiliate::Company.availabilities

    POST /companies/<shortname>/availabilities/<Availability.pk>/bookings/
    FareHarbor::Affiliate::Company

    GET /companies/<shortname>/bookings/<Booking.uuid>/
    FareHarbor::Affiliate::Company.bookings

    DELETE /companies/<shortname>/bookings/<Booking.uuid>/
    FareHarbor::Affiliate::Company

    POST /companies/<shortname>/availabilities/<Availability.pk>/bookings/validate/
    FareHarbor::Affiliate::Company

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/fareharbor_external_api.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
