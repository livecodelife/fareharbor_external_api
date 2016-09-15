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

      def self.items(items_hash)
        service.get_items(items_hash)
      end

      def self.availabilities_by_date(availabilities_by_date_hash)
        service.get_availabilities_by_date(availabilities_by_date_hash)
      end

      def self.availabilities_by_date_range(availabilities_by_date_range_hash)
        service.get_availabilities_by_date_range(availabilities_by_date_range_hash)
      end

      def self.availability(availability_hash)
        service.get_availability(availability_hash)
      end

      def self.booking(booking_hash)
        service.get_booking(booking_hash)
      end

      def self.lodgings(lodgings_hash)
        service.get_lodgings(lodgings_hash)
      end

      def self.availability_lodgings(availability_lodgings_hash)
        service.get_availability_lodgings(availability_lodgings_hash)
      end

      def self.create_booking(booking_hash)
        service.post_booking(booking_hash)
      end

      def self.verify_booking(booking_hash)
        service.post_verify_booking(booking_hash)
      end

      def self.cancel_booking(booking_hash)
        service.delete_booking(booking_hash)
      end
    end
  end
end
