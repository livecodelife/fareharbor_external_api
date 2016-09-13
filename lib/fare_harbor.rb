require 'fareharbor_external_api/version'
require 'faraday'
require 'fare_harbor_service'

module FareHarbor
  module Affiliate
    class Companies

      def self.service
        FareHarborService.new
      end

      def self.all
        service.get_companies
      end

      def self.items(company_name)
        service.get_items(company_name)
      end

      def self.availabilities_by_date(name, id, date)
        service.get_availabilities_by_date(name, id, date)
      end

      def self.availabilities_by_date_range(name, id, start_date, end_date)
        service.get_availabilities_by_date_range(name, id, start_date, end_date)
      end

      def self.availability(company_name, id)
        service.get_availability(company_name, id)
      end
    end
  end
end
