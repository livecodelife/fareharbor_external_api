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

  def get_items(items_hash)
    response = connection.get "companies/#{items_hash[:company_shortname]}/items/"
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

  def get_availability(availability_hash)
    response = connection.get "companies/#{availability_hash[:company_shortname]}/availabilities/#{availability_hash[:pk]}/"
    parse(response)
  end

  def get_booking(booking_hash)
    response = connection.get "companies/#{booking_hash[:company_shortname]}/bookings/#{booking_hash[:uuid]}/"
    parse(response)
  end

  def get_lodgings(lodgings_hash)
    response = connection.get "companies/#{lodgings_hash[:company_shortname]}/lodgings/"
    parse(response)
  end

  def get_availability_lodgings(availability_lodgings_hash)
    response = connection.get "companies/#{availability_lodgings_hash[:company_shortname]}/availabilities/#{availability_lodgings_hash[:pk]}/lodgings/"
    parse(response)
  end

private

  def connection
    @_connection
  end

  def parse(response)
    JSON.parse(response.body)
  end
end
