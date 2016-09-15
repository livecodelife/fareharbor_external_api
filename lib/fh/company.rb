module FH
  class Company
    attr_reader :name, :shortname

    def initialize(company)
      @name = company[:name]
      @shortname = company[:shortname]
    end

    def service
      FareHarborService.new
    end

    def items
      all_items = service.get_items(self.shortname)
      all_items[:items].map { |item| FH::Company::Item.new(item) }
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

    def booking(booking_hash)
      booking = service.get_booking(shortname, booking_hash)
      FH::Company::Booking.new(booking[:booking])
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
