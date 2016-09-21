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

The FareHarbor External API Gem is a wrapper for the FareHarbor External API.  Each endpoint of the API returns data for companies associated with an affiliate or that the API-user has permission to access.

All endpoints are rooted at `https://fareharbor.com/api/external/v1/`.  

To see the full JSON output that each endpoint returns, please visit our [endpoint documentation.](https://github.com/FareHarbor/fareharbor-docs/blob/master/external-api/endpoints.md)

#### Primary Usage

To access a single affiliate company, you can use the find method. This will return a single company object.  For ease of use, it is recommended that you save the result to a variable.

`company = FH::Companies.find('<company shortname>')`

You can now call methods on that company object to retrieve data about the company.  Here is a sample method being called on the company object after is has been saved as variable:

`company.items`

If you know the company shortname and name, you can also manually create an instance of a company.  Please note that if you choose to instantiate a company this way, you will need to pass in your data as a hash indicating the company shortname and name:

`company = FH::Company.new({shortname: '<company shortname>', name: '<company name>'})`

When a company has been instantiated, it has these attributes:

* shortname
* name

You can retrieve those attributes of a company by calling them as methods:

`company.shortname`
`company.name`

Please see the 'Endpoints and Methods' sections below for a full list of endpoints and their corresponding methods to retrieve data.

### Endpoints and Methods

Use the methods below to easily consume endpoint data from the FareHarbor External API:

###### All Companies

    Endpoint: `GET /companies/`

    Method:   `FH::Companies.all`

Returns all companies belonging to an affiliate; note that this may include companies that have no bookable availabilities.
Data is returned as an array of company objects. You can call methods on each company object in the array to return specific company data.  For information about how to use a single company object, please see 'Primary Usage'.

###### Lodgings

    Endpoint: `GET /companies/<shortname>/lodgings/`

    Method:   `FH::Company.lodgings`


With the wrapper, this is transposed into `Company` objects:

    [#<FH::Company:0x007fd17b8f17c8 @name="Hawaiian Adventures", @shortname="hawaiianadventures">,
    #<FH::Company:0x007fd17b8f15e8 @name="Surf Lessons Hawaii", @shortname="surflessonshawaii">]

as an array, you can call typical array methods to choose a particular company to call `Company` methods on, although it may be preferable to find a `Company` and call the methods that way.

You can find the API information for this endpoint [here](https://github.com/FareHarbor/fareharbor-docs/blob/master/external-api/endpoints.md#companies).

    `GET /companies/<shortname>/lodgings/`

Returns a list of all lodgings for a specific company.

Method:

    FH::Company.lodgings

The easiest way to use this would be something like this:

    company = FH::Companies.find(<company shortname>)

    company.lodgings

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

###### Availability Lodgings

    Endpoint: GET /companies/<shortname>/availabilities/<availability.pk>/lodgings/
    Method:   FH::Company.availability_lodgings

###### Items

    Endpoint: GET /companies/<shortname>/items/
    Method:   FH::Company.items

###### Availabilities By Date

    Endpoint: GET /companies/<shortname>/items/<item.pk>/availabilities/date/<date>/
    Method:   FH::Company.availabilities_by_date

###### Availabilities By Date Range

    Endpoint: GET /companies/<shortname>/items/<item.pk>/availabilities/date-range/<start-date>/<end-date>/
    Method:   FH::Company.availabilities_by_date_range

###### Availabilities

    Endpoint: GET /companies/<shortname>/availabilities/<Availability.pk>/
    Method:   FH::Company.availabilities

###### Create A Booking

    Endpoint: POST /companies/<shortname>/availabilities/<Availability.pk>/bookings/
    Method:   FH::Company

###### Bookings

    Endpoint: GET /companies/<shortname>/bookings/<Booking.uuid>/
    Method:   FH::Company.bookings

###### Delete A Booking

    Endpoint: DELETE /companies/<shortname>/bookings/<Booking.uuid>/
    Method:   FH::Company

###### Validate A Booking

    Endpoint: POST /companies/<shortname>/availabilities/<Availability.pk>/bookings/validate/
    Method:   FH::Company

## Troubleshooting

Some methods refer to `Companies` while others refer to `Company`.  Please double-check the documentation above to ensure your syntax is correct.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/fareharbor_external_api.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
