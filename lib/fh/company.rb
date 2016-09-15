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
      all_items = service.get_items(shortname)
      all_items[:items].map { |item| FH::Company::Item.new(item) }
    end

    def availabilities_by_date(availability_data)
      availabilities = service.get_availabilities_by_date(shortname, availability_data)
      availabilities[:availabilities].map { |availability| FH::Company::Availability.new(availability) }
    end

    def availabilities_by_date_range(availability_data)
      availabilities = service.get_availabilities_by_date_range(shortname, availability_data)
      availabilities[:availabilities].map { |availability| FH::Company::Availability.new(availability) }
    end

    def availability(pk)
      availability = service.get_availability(shortname, pk)
      FH::Company::Availability.new(availability[:availability])
    end

    def booking(uuid)
      booking = service.get_booking(shortname, uuid)
      FH::Company::Booking.new(booking[:booking])
    end

    def lodgings
      all_lodgings = service.get_lodgings(shortname)
      all_lodgings[:lodgings].map { |lodging| FH::Company::Lodging.new(lodging) }
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
