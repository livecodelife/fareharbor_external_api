require 'spec_helper'

describe FareHarbor::Affiliate::Company do
  it 'exists' do
    expect FareHarbor::Affiliate::Company
  end

  it 'retrieves all companies' do
    VCR.use_cassette('companies#all') do
      companies_hash = FareHarbor::Affiliate::Company.all
      companies = companies_hash['companies']
      company = companies.first

      expect(companies.count).to eq 3
      expect(companies_hash.class).to eq Hash
      expect(companies.class).to eq Array
      expect(company.keys).to eq(['shortname', 'name'])
      expect(company['shortname']).to eq('bodyglove')
      expect(company['name']).to eq('Body Glove')
    end
  end

  it 'retrieves all items for specific company' do
    VCR.use_cassette('companies#items') do
      items_hash = FareHarbor::Affiliate::Company.items(company_shortname: 'islandsailing')
      items = items_hash['items']
      item = items.first

      expect(items_hash.class).to eq Hash
      expect(items.class).to eq Array
      expect(item['name']).to eq('1 Hr Sailboat Tour')
      expect(item['location']).to eq('San Francisco Bay')
    end
  end

  it 'retrieves all availabilities by date for specific item' do
    VCR.use_cassette('companies#availabilities_by_date') do
      availabilities_hash = FareHarbor::Affiliate::Company.availabilities_by_date(company_shortname: 'sharktourshawaii', pk: 1108, date: '2016-11-14')
      availabilities = availabilities_hash['availabilities']
      availability = availabilities.first

      expect(availabilities.count).to eq 4
      expect(availabilities_hash.class).to eq Hash
      expect(availabilities.class).to eq Array
      expect(availability['start_at']).to eq '2016-11-14T07:00:00-1000'
      expect(availability['end_at']).to eq '2016-11-14T08:30:00-1000'
      expect(availability['capacity']).to eq 18
      expect(availability['pk']).to eq 435426
    end
  end

  it 'retrieves all availabilities by a range of dates for specific item' do
    VCR.use_cassette('companies#availabilities_by_date_range') do
      availabilities_hash = FareHarbor::Affiliate::Company.availabilities_by_date_range(company_shortname: 'sharktourshawaii', pk: 1108, start_date: '2016-11-14', end_date: '2016-11-17')
      availabilities = availabilities_hash['availabilities']
      availability = availabilities.last

      expect(availabilities.count).to eq 16
      expect(availabilities_hash.class).to eq Hash
      expect(availabilities.class).to eq Array
      expect(availability['start_at']).to eq '2016-11-17T13:00:00-1000'
      expect(availability['end_at']).to eq '2016-11-17T14:30:00-1000'
      expect(availability['capacity']).to eq 18
      expect(availability['pk']).to eq 391217
    end
  end

  it 'retrieves specific availability for company' do
    VCR.use_cassette('companies#availability') do
      availability_hash = FareHarbor::Affiliate::Company.availability(company_shortname: 'bodyglove', pk: 70050)
      availability = availability_hash['availability']

      expect(availability_hash.class).to eq Hash
      expect(availability.class).to eq Hash
      expect(availability['capacity']).to eq 120
      expect(availability['start_at']).to eq '2016-11-24T08:00:00-1000'
    end
  end

  it 'retrieves a specific booking for a companys item' do
    VCR.use_cassette('companies#booking') do
      booking_hash = FareHarbor::Affiliate::Company.booking(company_shortname: 'bodyglove', uuid: '85ab9e4c-03fd-4bd4-af67-4946aa426c79')
      booking = booking_hash['booking']

      expect(booking_hash.class).to eq Hash
      expect(booking.class).to eq Hash
      expect(booking['uuid']).to eq '85ab9e4c-03fd-4bd4-af67-4946aa426c79'
      expect(booking['status']).to_not eq nil
    end
  end

  it 'retrieves lodgings for a company' do
    VCR.use_cassette('companies#lodgings') do
      lodgings_hash = FareHarbor::Affiliate::Company.lodgings(company_shortname: 'bodyglove')
      lodgings = lodgings_hash['lodgings']
      lodging = lodgings.first

      expect(lodgings_hash.class).to eq Hash
      expect(lodgings.class).to eq Array
      expect(lodging.class).to eq Hash
      expect(lodging['name']).to eq 'Alii Cove'
      expect(lodging['pk']).to eq 555
    end
  end

  it 'retrieves lodgings for an availability' do
    VCR.use_cassette('company#availability_lodgings') do
      availability_lodgings_hash = FareHarbor::Affiliate::Company.availability_lodgings(company_shortname: 'bodyglove', pk: 70050)
      availability_lodgings = availability_lodgings_hash['lodgings']
      availability_lodging = availability_lodgings.last

      expect(availability_lodgings_hash.class).to eq Hash
      expect(availability_lodgings.class).to eq Array
      expect(availability_lodging.class).to eq Hash
      expect(availability_lodging['name']).to eq 'WorldMark by Wyndham'
      expect(availability_lodging['pk']).to eq 637
    end
  end

  it 'creates a booking' do
    VCR.use_cassette('company#create_booking') do
      booking_hash = FareHarbor::Affiliate::Company.create_booking(
        pk: 70043,
        company_shortname: 'bodyglove',
        name: 'John Doe',
        phone: '415-789-4563',
        email: 'johndoe@example.com',
        customer_type_rates: [149126, 149126],
        note: 'Optional booking note',
        voucher_number: 'VN-123456'
      )
      require "pry"; binding.pry
      booking = booking_hash['booking']
      status = booking['status']

      expect(booking_hash.class).to eq Hash
      expect(status).to eq 'booked'
    end
  end
end
