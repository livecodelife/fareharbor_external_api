require 'fareharbor_external_api/version'
require 'faraday'
require 'fare_harbor_service'

module FareHarbor
  module Affiliate
    class Company

      def self.service
        FareHarborService.new
      end

      def self.all
        service.get_companies
      end

      def self.items(company_shortname)
        service.get_items(company_shortname)
      end

      def self.availabilities_by_date(company_shortname, id, date)
        service.get_availabilities_by_date(company_shortname, id, date)
      end

      def self.availabilities_by_date_range(company_shortname, id, start_date, end_date)
        service.get_availabilities_by_date_range(company_shortname, id, start_date, end_date)
      end

      def self.availability(company_shortname, id)
        service.get_availability(company_shortname, id)
      end

      def self.booking(booking_hash)
        service.get_booking(booking_hash)
      end
    end
  end
end
