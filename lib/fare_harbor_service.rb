require 'fh/company'

class FareHarborService

  def initialize
    @_connection = Faraday.new('https://demo.fareharbor.com/api/external/v1/')
    @_connection.params[:'api-app'] = ENV['FAREHARBOR_API_APP_KEY']
    @_connection.params[:'api-user'] = ENV['FAREHARBOR_API_USER_KEY']
  end

  def get_companies
    response = connection.get 'companies/'
    parse(response)
  end

  def get_items(shortname)
    response = connection.get "companies/#{shortname}/items/"
    parse(response)
  end

  def get_availabilities_by_date(availabilities_by_date_hash)
    response = connection.get "companies/#{availabilities_by_date_hash[:company_shortname]}/items/#{availabilities_by_date_hash[:pk]}/minimal/availabilities/date/#{availabilities_by_date_hash[:date]}/"
    parse(response)
  end

  def get_availabilities_by_date_range(availabilities_by_date_range_hash)
    response = connection.get "companies/#{availabilities_by_date_range_hash[:company_shortname]}/items/#{availabilities_by_date_range_hash[:pk]}/minimal/availabilities/date-range/#{availabilities_by_date_range_hash[:start_date]}/#{availabilities_by_date_range_hash[:end_date]}/"
    parse(response)
  end

  def get_availability(shortname, pk)
    response = connection.get "companies/#{shortname}/availabilities/#{pk}/"
    parse(response)
  end

  def get_booking(shortname, uuid)
    response = connection.get "companies/#{shortname}/bookings/#{uuid}/"
    parse(response)
  end

  def get_lodgings(shortname)
    response = connection.get "companies/#{shortname}/lodgings/"
    parse(response)
  end

  def get_availability_lodgings(availability_lodgings_hash)
    response = connection.get "companies/#{availability_lodgings_hash[:company_shortname]}/availabilities/#{availability_lodgings_hash[:pk]}/lodgings/"
    parse(response)
  end

  def post_booking(booking_hash)
    booking_data = format_booking_body(booking_hash).to_json
    response = connection.post do |req|
      req.url "companies/#{booking_hash[:company_shortname]}/availabilities/#{booking_hash[:pk]}/bookings/"
      req.headers['Content-Type'] = 'application/json'
      req.body = booking_data
    end
    parse(response)
  end

  def post_verify_booking(booking_hash)
    booking_data = format_booking_body(booking_hash).to_json
    response = connection.post do |req|
      req.url "companies/#{booking_hash[:company_shortname]}/availabilities/#{booking_hash[:pk]}/bookings/validate/"
      req.headers['Content-Type'] = 'application/json'
      req.body = booking_data
    end
    parse(response)
  end

  def delete_booking(booking_hash)
    response = connection.delete "companies/#{booking_hash[:company_shortname]}/bookings/#{booking_hash[:uuid]}/"
    parse(response)
  end

  def format_booking_body(booking_hash)
    {
      "voucher_number": booking_hash[:voucher_number],
      "contact": {
        "name": booking_hash[:name],
        "phone": booking_hash[:phone],
        "email": booking_hash[:email]
      },
      "customers": customer_types(booking_hash[:customer_type_rates]),
      "note": "Optional booking note"
    }
  end

  def customer_types(types)
    types.map do |type|
      {"customer_type_rate" => type}
    end
  end

private

  def connection
    @_connection
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
