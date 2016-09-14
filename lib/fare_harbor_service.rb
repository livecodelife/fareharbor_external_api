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

  def get_items(company_name)
    response = connection.get "companies/#{company_name}/items/"
    parse(response)
  end

  def get_availabilities_by_date(name, id, date)
    response = connection.get "companies/#{name}/items/#{id}/minimal/availabilities/date/#{date}/"
    parse(response)
  end

  def get_availabilities_by_date_range(name, id, start_date, end_date)
    response = connection.get "companies/#{name}/items/#{id}/minimal/availabilities/date-range/#{start_date}/#{end_date}/"
    parse(response)
  end

  def get_availability(company_name, id)
    response = connection.get "companies/#{company_name}/availabilities/#{id}/"
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
