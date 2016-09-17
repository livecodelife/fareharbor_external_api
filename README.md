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

## Setup

#### Requesting Access

To get started with the FareHarbor External API Gem, you will need to request access keys from FareHarbor. Please contact <support@fareharbor.com> to request access to the FareHarbor External API.

Once you have your keys, you will need to save them.

#### Setting Up Your Access Keys

Once you have your access keys, you will need to set them as environment variables to work with the gem.  Below are two options for setting your environment variables.

###### For Use in Production

We recommend using the Figaro gem to set your environment variables.  Follow the directions to set your keys [here.](https://github.com/laserlemon/figaro#example)

In your application.yml file, set your keys like this:

    FAREHARBOR_API_APP_KEY=<your_api_app_key>
    FAREHARBOR_API_USER_KEY=<your_api_user_key>

Your key names must match the above key names exactly.  Once you are done, make sure you add application.yml to your .gitignore file to keep your keys hidden!

###### For Local Use

You can either set your keys using the Figaro gem (instructions above) or inside your bash profile.  To set your keys inside your bash profile, open your bash profile and add the following lines:

    export FAREHARBOR_API_APP_KEY=<your_api_app_key>
    export FAREHARBOR_API_USER_KEY=<your_api_user_key>

To save your changes, enter the following in your command line:

    source ~/.bash_profile


## Usage

The FareHarbor External API Gem is a wrapper for the FareHarbor External API.  Each endpoint returns data only for companies that the affiliate / API-user has permission to access.

#### Single Company

To access a single company and find data pertaining to that company, you can use the find method.  For ease of use, it is recommended that you save the result to a variable.

`company = FH::Companies.find('<company shortname goes here>')`

Now you have the ability to call methods on the affiliate variable. For example

`company.items('<company shortname goes here>')`

Is the equivalent of:

`FH::Company.items('<company shortname goes here>')`

#### All Companies

To access a list of all affiliate companies, use the all method:

`FH::Companies.all`


### Paths

All endpoints are rooted at `https://fareharbor.com/api/external/v1/`.

Use the methods below to access JSON data corresponding with each endpoint:

`GET /companies/`

Returns a list of all companies for which you have permission to create bookings;
note that this may include companies that have no bookable availabilities.


Method:

    FH::Companies.all


Example response:

     [
        {
          "shortname": "hawaiianadventures",
          "name": "Hawaiian Adventures"
        }, {
          "shortname": "surflessonshawaii",
          "name": "Surf Lessons Hawaii"
        }
      ]

    GET /companies/<shortname>/lodgings/
    FH::Company.lodgings

    GET /companies/<shortname>/availabilities/<availability.pk>/lodgings/
    FH::Company.availability_lodgings

    GET /companies/<shortname>/items/
    FH::Company.items

    GET /companies/<shortname>/items/<item.pk>/availabilities/date/<date>/
    FH::Company.availabilities_by_date

    GET /companies/<shortname>/items/<item.pk>/availabilities/date-range/<start-date>/<end-date>/
    FH::Company.availabilities_by_date_range

    GET /companies/<shortname>/availabilities/<Availability.pk>/
    FH::Company.availabilities

    POST /companies/<shortname>/availabilities/<Availability.pk>/bookings/
    FH::Company

    GET /companies/<shortname>/bookings/<Booking.uuid>/
    FH::Company.bookings

    DELETE /companies/<shortname>/bookings/<Booking.uuid>/
    FH::Company

    POST /companies/<shortname>/availabilities/<Availability.pk>/bookings/validate/
    FH::Company

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/fareharbor_external_api.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
