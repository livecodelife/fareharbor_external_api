require 'spec_helper'

describe FH::Company::Availability do
  it 'exists' do
    expect FH::Company::Availability
  end

  it 'responds to methods' do
    VCR.use_cassette('company#availability') do
      company = FH::Companies.find('bodyglove')
      availability = company.availability(70050)
      expect(availability).to respond_to :capacity
      expect(availability).to respond_to :customer_type_rates
      expect(availability).to respond_to :custom_field_instances
      expect(availability).to respond_to :item
      expect(availability).to respond_to :pk
      expect(availability).to respond_to :start_at
      expect(availability).to respond_to :end_at
    end
  end
end
