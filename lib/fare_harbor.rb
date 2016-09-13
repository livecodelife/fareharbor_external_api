require 'fareharbor_external_api/version'
require 'faraday'

module FareHarbor
  module Affiliate
    class Companies

      def self.all
        connection = Faraday.new('https://demo.fareharbor.com/api/external/v1/')
        connection.params[:'api-app'] = ENV['API_APP_KEY']
        connection.params[:'api-user'] = ENV['API_USER_KEY']

        response = connection.get 'companies/'
        JSON.parse(response.body)
      end

      def self.items(company_name)
        connection = Faraday.new('https://demo.fareharbor.com/api/external/v1/')
        connection.params[:'api-app'] = ENV['API_APP_KEY']
        connection.params[:'api-user'] = ENV['API_USER_KEY']

        response = connection.get "companies/#{company_name}/items/"
        JSON.parse(response.body)
      end
    end
  end
end
