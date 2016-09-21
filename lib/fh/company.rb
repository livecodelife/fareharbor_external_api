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
      items = service.get_items(shortname)
      items[:items].map { |item| FH::Company::Item.new(item) }
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
      lodgings = service.get_lodgings(shortname)
      create_lodgings(lodgings)
    end

    def availability_lodgings(pk)
      lodgings = service.get_availability_lodgings(shortname, pk)
      create_lodgings(lodgings)
    end

    def create_booking(booking_request)
      booking = service.post_booking(booking_request)
      FH::Company::Booking.new(booking[:booking])
    end

    def verify_booking(booking_data)
      verification = service.post_verify_booking(booking_data)
      FH::Company::Booking::Verification.new(verification)
    end

    def cancel_booking(uuid)
      cancelled_booking = service.delete_booking(shortname, uuid)
      FH::Company::Booking.new(cancelled_booking[:booking])
    end
  end

  private

    def create_lodgings(lodgings)
      lodgings[:lodgings].map { |lodging| FH::Company::Lodging.new(lodging) }
    end
end
