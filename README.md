# FareharborExternalApi

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

You can either set your keys using the Figaro gem (instructions above) or inside your bash profile.  To set your keys inside your bash profile, open your bash profile and add the following:

    export FAREHARBOR_API_APP_KEY=<your_api_app_key>
    export FAREHARBOR_API_USER_KEY=<your_api_user_key>

To save your changes, enter the following in your command line:

    source ~/.bash_profile


## Usage

The FareHarbor External API Gem is a wrapper for the FareHarbor External API.  Each endpoint returns data for companies associated with an affiliate or that the API-user has permission to access.

All endpoints are rooted at `https://fareharbor.com/api/external/v1/`.  

To see the full JSON output that each endpoint returns, please visit our [endpoint documentation.](https://github.com/FareHarbor/fareharbor-docs/blob/master/external-api/endpoints.md)

#### Single Company

To access a single affiliate company, you can use the find method. This will return a single company object.  For ease of use, it is recommended that you save the result to a variable.

`company = FH::Companies.find('<company shortname>')`

You can now call methods on that company object to retrieve data about the company.  Here is a sample method being called on the company object after is has been saved as variable:

`company.items`


If you know the company shortname and name, you can also manually create an instance of a company.  Please note that if you choose to instantiate a company this way, you will need to pass in your data as a hash indicating the company shortname and name:

`company = FH::Company.new({shortname: '<company shortname>', name: '<company name>'})`


Please see the 'paths' sections below for a full list of methods that can be called on a company object.


### Paths

Use the methods below to access affiliate company data:

`GET /companies/`

Returns all companies belonging to an affiliate.  Data is returned as an array of company objects. You can call methods on each company object in the array to return specific company data; note that this may include companies that have no bookable availabilities.


Method:

    company = FH::Companies.all


Company Attributes:

* shortname
* name

    company.shortname

    name
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
