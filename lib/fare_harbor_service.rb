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

  def get_availabilities_by_date(shortname, availability_data)
    response = connection.get "companies/#{shortname}/items/#{availability_data[:pk]}/minimal/availabilities/date/#{availability_data[:date]}/"
    parse(response)
  end

  def get_availabilities_by_date_range(shortname, availability_data)
    response = connection.get "companies/#{shortname}/items/#{availability_data[:pk]}/minimal/availabilities/date-range/#{availability_data[:start_date]}/#{availability_data[:end_date]}/"
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

  def get_availability_lodgings(shortname, pk)
    response = connection.get "companies/#{shortname}/availabilities/#{pk}/lodgings/"
    parse(response)
  end

  def post_booking(booking_data)
    booking_request = format_booking_body(booking_data).to_json
    response = connection.post do |req|
      req.url "companies/#{booking_data[:company_shortname]}/availabilities/#{booking_data[:pk]}/bookings/"
      req.headers['Content-Type'] = 'application/json'
      req.body = booking_request
    end
    parse(response)
  end

  def post_verify_booking(booking_data)
    verification_request = format_booking_body(booking_data).to_json
    response = connection.post do |req|
      req.url "companies/#{booking_data[:company_shortname]}/availabilities/#{booking_data[:pk]}/bookings/validate/"
      req.headers['Content-Type'] = 'application/json'
      req.body = verification_request
    end
    parse(response)
  end

  def delete_booking(shortname, uuid)
    response = connection.delete "companies/#{shortname}/bookings/#{uuid}/"
    parse(response)
  end

  def format_booking_body(booking_request)
    {
      "voucher_number": booking_request[:voucher_number],
      "contact": {
        "name": booking_request[:name],
        "phone": booking_request[:phone],
        "email": booking_request[:email]
      },
      "customers": customer_types(booking_request[:customer_type_rates]),
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
