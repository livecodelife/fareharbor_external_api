# FareharborExternalApi


# Installation

Add this line to your application's Gemfile:

```ruby
gem 'fareharbor_external_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fareharbor_external_api

# Setup

## Requesting Access

To get started with the FareHarbor External API Gem, you will need to request access keys from FareHarbor. Please contact <support@fareharbor.com> to request access to the FareHarbor External API.

## Setting Up Your Access Keys

Once you have your access keys, you will need to set them as environment variables to work with the gem.  Below are two options for setting your environment variables.

## For Use in Production

We recommend using the Figaro gem to set your environment variables.  Follow the directions to set your keys [here.](https://github.com/laserlemon/figaro#example)

In your application.yml file, set your keys like this:

    FAREHARBOR_API_APP_KEY=<your_api_app_key>
    FAREHARBOR_API_USER_KEY=<your_api_user_key>

Your key names must match the above key names exactly.  Once you are done, make sure you add application.yml to your .gitignore file to keep your keys hidden!

## For Local Use

You can either set your keys using the Figaro gem (instructions above) or inside your bash profile.  To set your keys inside your bash profile, open your bash profile and add the following lines:

```
export FAREHARBOR_API_APP_KEY=<your_api_app_key>
export FAREHARBOR_API_USER_KEY=<your_api_user_key>
```

To save your changes, enter the following in your command line:

    source ~/.bash_profile


# Usage

The FareHarbor External API Gem is a wrapper for the FareHarbor External API.  Each endpoint of the API returns data for companies associated with an affiliate or that the API-user has permission to access.

All endpoints are rooted at `https://fareharbor.com/api/external/v1/`.  

To see the full JSON output that each endpoint returns, please visit our [endpoint documentation.](https://github.com/FareHarbor/fareharbor-docs/blob/master/external-api/endpoints.md)

## Primary Usage and Finding a Company

To access a single affiliate company, you can use the find method. This will return a single company object.  The find method accepts the company 'shortname' as an argument passed in as a string. For ease of use, it is recommended that you save the result to a variable.

`company = FH::Companies.find('<company shortname>')`

You can now call methods on that company object to retrieve data about the company.  Here is a sample method being called on the company object after is has been saved as variable:

`company.items`

If you know the company shortname and name, you can also manually create an instance of a company.  Please note that if you choose to instantiate a company this way, you will need to pass in your data as a hash with keys of 'shortname' and 'name' and their respective values as strings:

`company = FH::Company.new({shortname: '<company shortname>', name: '<company name>'})`

A Company has the following attributes which can be accessed by calling them as methods:

    company = FH::Companies.find('<company shortname>')

    company.shortname
    company.name

Please see the 'Endpoints and Methods' sections below for a full list of endpoints and their corresponding methods to retrieve data.

# Endpoints and Methods

Use the methods below to easily consume endpoint data from the FareHarbor External API.  Please note that in all methods below `company` refers to a Company object.  For more information on how to instantiate a company object, please visit the 'Primary Usage section.'

## All Companies

    Endpoint: GET /companies/

    Method:   FH::Companies.all

Returns an array of Company objects; note that this may include companies that have no bookable availabilities. You can call methods on each Company object to return specific company data.  For more information on how to use a single Company object, please see 'Primary Usage'.

You can find the API information for all companies [here](https://github.com/FareHarbor/fareharbor-docs/blob/master/external-api/endpoints.md#companies).

## Lodgings

    Endpoint: GET /companies/<shortname>/lodgings/

    Method:   company.lodgings

Returns an array of Lodging objects.  

A Lodging has the follwing attributes which can be accessed by calling them as methods:

    lodging = company.lodgings.first

    lodging.name  
    lodging.is_self_lodging
    lodging.url
    lodging.phone
    lodging.address
    lodging.pk  

You can find the API information for all lodgings [here](https://github.com/FareHarbor/fareharbor-docs/blob/master/external-api/endpoints.md#lodgings).

## Availability Lodgings

    Endpoint: GET /companies/<shortname>/availabilities/<availability.pk>/lodgings/

    Method:   company.availability_lodgings(<availability pk>)

Returns an array of Lodging objects that include availability specific data.  Method accepts lodging 'pk' as an argument passed in as an integer.

A Lodging has the following attributes which can be accessed by calling them as methods:

    lodging = company.availability_lodgings(<availability pk>).first

    lodging.name  
    lodging.is_self_lodging
    lodging.url
    lodging.phone
    lodging.address
    lodging.pk  
    lodging.is_pickup_available

You can find the API information for all availability lodgings [here](https://github.com/FareHarbor/fareharbor-docs/blob/master/external-api/endpoints.md#availability-lodgings).

## Items

    Endpoint: GET /companies/<shortname>/items/

    Method:   company.items

Returns an array of Item objects for which you have permission to create bookings; again, note that this may include items that have no bookable availabilities.


An Item has the following attributes which can be accessed by calling them as methods:

    item = company.items.first

    item.image_cdn_url
    item.name  
    item.cancellation_policy_safe_html
    item.headline
    item.cancellation_policy
    item.is_pickup_ever_available
    item.description_safe_html
    item.location
    item.customer_prototypes
    item.images
    item.pk
    item.tax_percentage
    item.description

You can find the API information for all items [here](https://github.com/FareHarbor/fareharbor-docs/blob/master/external-api/endpoints.md#items).


## Availabilities


**Single Availability**

    Endpoint: GET /companies/<shortname>/availabilities/<Availability.pk>/

    Method:   company.availabilities

Returns an Availability object.

**Availabilities By Date:**

    Endpoint: GET /companies/<shortname>/items/<item.pk>/availabilities/date/<date>/

    Method:   company.availabilities_by_date({pk: <availability pk>, date: '<availability date>'})

**Availabilities By Date Range:**

    Endpoint: GET /companies/<shortname>/items/<item.pk>/availabilities/date-range/<start-date>/<end-date>/

    Method:   company.availabilities_by_date_range({pk: <availability pk>, start_date: '<availability start date>', end_date: '<availability end date>'})

Returns an array of Availability objects.  Returns possibly-bookable availabilities for date, or for the range start-date through end-date. Note that possibly-bookable availabilities include those for which customers are requested to "call to book". Note that 'date', 'start_date', and 'end_date' should be in the format 'YYYY-MM-DD' and passed in a string, while the availability 'pk' should be passed in as an integer. When searching for an availability by date, these values must all be passed in through a single hash.

An Availability has the following attributes which can be accessed by calling them as methods:

    availability = company.availabilities.first
    availability = company.availabilities_by_date({pk: <availability pk>, date: '<availability date>'}).first
    availability = company.availabilities_by_date_range({pk: <availability pk>, start_date: '<availability start date>', end_date: '<availability end date>'}).first

    availability.capacity
    availability.customer_type_rates
    availability.custom_field_instances
    availability.item
    availability.pk
    availability.start_at
    availability.end_at

You can find the API information for all availabilities [here](https://github.com/FareHarbor/fareharbor-docs/blob/master/external-api/endpoints.md#availabilities).


## Bookings

The following booking methods each return a Booking object.

A Booking has the following attributes which can be accessed by calling them as methods:

        booking = company.booking('<booking uuid>')

        booking.display_id
        booking.status
        booking.customers
        booking.uuid
        booking.receipt_taxes
        booking.note_safe_html
        booking.receipt_subtotal
        booking.arrival
        booking.rebooked_to
        booking.confirmation_url
        booking.note
        booking.receipt_total
        booking.pickup
        booking.contact
        booking.invoice_price
        booking.custom_field_values
        booking.pk
        booking.rebooked_from
        booking.external_id
        booking.availability
        booking.voucher_number

### Find A Single Booking

    Endpoint: GET /companies/<shortname>/bookings/<Booking.uuid>/

    Method:   company.booking('<booking uuid>')

Booking method accepts booking 'uuid' as an argument passed in as a string.

### Create And Validate A Booking

**Create a Booking:**

    Endpoint: POST /companies/<shortname>/availabilities/<Availability.pk>/bookings/

    Method:   company.post_booking(booking_data)

**Validate a Booking:**

    Endpoint: POST /companies/<shortname>/availabilities/<Availability.pk>/bookings/validate/

    Method:   company.post_verify_booking(booking_data)

These post requests accept a hash as an argument in the following format:

        booking_data = {
        pk: <availability pk (integer)>,
        company_shortname: '<company shortname (string)>',
        name: '<name (string)>',
        phone: '<phone (string)>',
        email: '<email (string)>',
        customer_type_rates: [<customer type rate (integer)>, <customer type rate (integer)>]
        note: '<note (string)>',
        voucher_number: '<voucher number (string)'
      }

Please note the class of each value in the hash.  Also note that customer type rates are represented by an array of integers.


### Delete A Booking

    Endpoint: DELETE /companies/<shortname>/bookings/<Booking.uuid>/

    Method:   company.cancel_booking('<booking uuid>')


You can find the API information for all bookings [here](https://github.com/FareHarbor/fareharbor-docs/blob/master/external-api/endpoints.md#bookings).


## Troubleshooting

Some methods refer to `Companies` while others refer to `Company`.  Please double-check the documentation above to ensure your syntax is correct.

Many methods take a hash as an argument.  Check the documentation above to make sure you are inputting your arguments correctly, and have included all the necessary arguments and formatted them correctly.

If you are having difficult setting your environment variables, make sure they are properly working by first testing them out in Postman.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/fareharbor_external_api.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
