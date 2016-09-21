require 'spec_helper'

describe FH::Company do
  it 'exists' do
    expect FH::Company
  end

  it 'retrieves all items for specific company' do
    company = FH::Companies.find('islandsailing')
    items = company.items
    item = items.first

    expect(items.class).to eq Array
    expect(item.class).to eq FH::Company::Item
    expect(item.name).to eq('1 Hr Sailboat Tour')
    expect(item.location).to eq('San Francisco Bay')
  end

  it 'retrieves all availabilities by date for specific item' do
    company = FH::Companies.find('sharktourshawaii')
    availabilities = company.availabilities_by_date(pk: 1108, date: '2016-11-14')
    availability = availabilities.first

    expect(availabilities.count).to eq 1
    expect(availabilities.class).to eq Array
    expect(availability.class).to eq FH::Company::Availability
    expect(availability.start_at).to eq '2016-11-14T07:00:00-1000'
    expect(availability.end_at).to eq '2016-11-14T08:30:00-1000'
    expect(availability.capacity).to eq 18
    expect(availability.pk).to eq 435426
  end

  it 'retrieves all availabilities by a range of dates for specific item' do
    company = FH::Companies.find('sharktourshawaii')
    availabilities = company.availabilities_by_date_range(pk: 1108, start_date: '2016-11-14', end_date: '2016-11-17')
    availability = availabilities.last

    expect(availabilities.count).to eq 1
    expect(availabilities.class).to eq Array
    expect(availability.class).to eq FH::Company::Availability
    expect(availability.start_at).to eq '2016-11-14T07:00:00-1000'
    expect(availability.end_at).to eq '2016-11-14T08:30:00-1000'
    expect(availability.capacity).to eq 18
    expect(availability.pk).to eq 435426
  end

  it 'retrieves specific availability for company' do
    company = FH::Companies.find('bodyglove')
    availability = company.availability(70050)

    expect(availability.class).to eq FH::Company::Availability
    expect(availability.start_at).to eq '2016-11-24T08:00:00-1000'
  end

  it 'retrieves a specific booking for a companys item' do
    company = FH::Companies.find('bodyglove')
    booking = company.booking('85ab9e4c-03fd-4bd4-af67-4946aa426c79')

    expect(booking.class).to eq FH::Company::Booking
    expect(booking.uuid).to eq '85ab9e4c-03fd-4bd4-af67-4946aa426c79'
    expect(booking.status).to_not eq nil
  end

  it 'retrieves lodgings for a company' do
    company = FH::Companies.find('bodyglove')
    lodgings = company.lodgings
    lodging = lodgings.first

    expect(lodgings.class).to eq Array
    expect(lodging.class).to eq FH::Company::Lodging
    expect(lodging.name).to eq 'Alii Cove'
    expect(lodging.pk).to eq 555
  end

  it 'retrieves lodgings for an availability' do
    company = FH::Companies.find('bodyglove')
    availability_lodgings = company.availability_lodgings(70050)
    availability_lodging = availability_lodgings.last

    expect(availability_lodgings.class).to eq Array
    expect(availability_lodging.class).to eq FH::Company::Lodging
    expect(availability_lodging.name).to eq 'WorldMark by Wyndham'
    expect(availability_lodging.pk).to eq 637
  end

  it 'creates a booking' do

    company = FH::Companies.find('bodyglove')
    booking = company.create_booking(
      pk: 70042,
      company_shortname: "#{company.shortname}",
      name: 'John Doe',
      phone: '415-789-4563',
      email: 'johndoe@example.com',
      customer_type_rates: [149124, 149124],
      note: 'Optional booking note',
      voucher_number: 'VN-123456'
    )
    customers = booking.customers
    contact_info = booking.contact

    expect(booking.class).to eq FH::Company::Booking
    expect(booking.status).to eq 'booked'
    expect(customers.class).to eq Array
    expect(customers.first.class).to eq Hash
    expect(contact_info[:phone]).to eq '415-789-4563'
    expect(contact_info[:email]).to eq 'johndoe@example.com'
    expect(contact_info[:name]).to eq 'John Doe'
  end

  it 'verifies a booking' do
    company = FH::Companies.find('bodyglove')
    booking_verification = company.verify_booking(
      pk: 70042,
      company_shortname: 'bodyglove',
      name: 'John Doe',
      phone: '415-789-4563',
      email: 'johndoe@example.com',
      customer_type_rates: [149124, 149124],
      note: 'Optional booking note',
      voucher_number: 'VN-123456'
    )

    expect(booking_verification.class).to eq FH::Company::Booking::Verification
    expect(booking_verification.is_bookable).to be true
    expect(booking_verification.invoice_price).to eq 28387
    expect(booking_verification.receipt_total).to eq 28387
  end

  it 'cancels a booking' do
    company = FH::Companies.find('bodyglove')
    booking = company.create_booking(
      pk: 70042,
      company_shortname: 'bodyglove',
      name: 'John Doe',
      phone: '415-789-4563',
      email: 'johndoe@example.com',
      customer_type_rates: [149124, 149124],
      note: 'Optional booking note',
      voucher_number: 'VN-123456'
    )
    cancelled_booking = company.cancel_booking(booking.uuid)

    expect(cancelled_booking.class).to eq FH::Company::Booking
    expect(cancelled_booking.uuid).to eq booking.uuid
    expect(cancelled_booking.status).to eq 'cancelled'
  end
end
