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

```
export FAREHARBOR_API_APP_KEY=<your_api_app_key>
export FAREHARBOR_API_USER_KEY=<your_api_user_key>
```

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

To access a list of all affiliate companies available to you, use the all method on the `Companies` class:

`FH::Companies.all`

this will return a list of `Company` objects.



### Paths

All endpoints are rooted at `https://fareharbor.com/api/external/v1/`.

Use the methods below to access JSON data corresponding with each endpoint:

`GET /companies/`

You can find the API information for this endpoint [here](https://github.com/FareHarbor/fareharbor-docs/blob/master/external-api/endpoints.md#companies).

Returns a list of all companies for which you have permission to create bookings;
note that this may include companies that have no bookable availabilities.


Method:

    FH::Companies.all


The example response from the API is as below:

     [
        {
          "shortname": "hawaiianadventures",
          "name": "Hawaiian Adventures"
        }, {
          "shortname": "surflessonshawaii",
          "name": "Surf Lessons Hawaii"
        }
      ]

With the wrapper, the response from the API is transposed into `Company` objects:

    [#<FH::Company:0x007fd17b8f17c8 @name="Hawaiian Adventures", @shortname="hawaiianadventures">,
    #<FH::Company:0x007fd17b8f15e8 @name="Surf Lessons Hawaii", @shortname="surflessonshawaii">]

as an array, you can call typical array methods to choose a particular company to call `Company` methods on, although it may be preferable to find a `Company` and call the methods that way.

`GET /companies/<shortname>/lodgings/`

You can find the API information for this endpoint [here](https://github.com/FareHarbor/fareharbor-docs/blob/master/external-api/endpoints.md#lodgings).

Returns a list of all lodgings for a specific company.

The easiest way to use this would be something like this:

    FH::Companies.find(<company shortname>).company.lodgings

Example response

    [
      {
       "pk": 231,
       "name": "Wyndham Royal Garden",
       "phone": "(808) 943-0202",
       "address": "440 Olohana St Honolulu, HI 96815",
       "url": "https:\/\/www.extraholidays.com\/honolulu-hawaii\/royal-garden-at-waikiki.aspx",
       "is_self_lodging": false
      }
    ]

With the wrapper, the response from the API is transposed into an array of `Lodging` objects:

    [#<FH::Company::Lodging:0x007fd1a1a58f50 @name="Alii Cove", @is_self_lodging=false, @url="", @phone="", @address="", @pk=555>, #<FH::Company::Lodging:0x007fd1a1a58eb0 @name="Alii Lani", @is_self_lodging=false, @url="", @phone="", @address="", @pk=556>]

`GET /companies/<shortname>/availabilities/<availability.pk>/lodgings/
    FH::Company.availability_lodgings`

You can find the API information for this endpoint [here](https://github.com/FareHarbor/fareharbor-docs/blob/master/external-api/endpoints.md#availability-lodgings).

Returns a list of all lodgings for a particular availability.

the easiest way to call it would be something like this:

    company = FH::Company.find(<company shortname>)
    company.availability_lodgings(<availability pk>)

Example response:

    {
      "lodgings": [
        {
          "pk": 231,
          "name": "Wyndham Royal Garden",
          "is_pickup_available": true
        }
      ]
    }

With the wrapper, the response from the API is transposed into an array of `Lodging` objects for the specific availability:

    [#<FH::Company::Lodging:0x007fd1a3567d28 @name="Chalet Kilauea - The Chalet Kilauea Collection", @is_self_lodging=nil, @url=nil, @phone=nil, @address=nil, @pk=565>, #<FH::Company::Lodging:0x007fd1a3567d00 @name="Club At Waikoloa Beach Resort by Hilton Grand Vacations", @is_self_lodging=nil, @url=nil, @phone=nil, @address=nil, @pk=566>]
...

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
