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

  def get_items(company_shortname)
    response = connection.get "companies/#{company_shortname}/items/"
    parse(response)
  end

  def get_availabilities_by_date(company_shortname, id, date)
    response = connection.get "companies/#{company_shortname}/items/#{id}/minimal/availabilities/date/#{date}/"
    parse(response)
  end

  def get_availabilities_by_date_range(company_shortname, id, start_date, end_date)
    response = connection.get "companies/#{company_shortname}/items/#{id}/minimal/availabilities/date-range/#{start_date}/#{end_date}/"
    parse(response)
  end

  def get_availability(company_shortname, id)
    response = connection.get "companies/#{company_shortname}/availabilities/#{id}/"
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
