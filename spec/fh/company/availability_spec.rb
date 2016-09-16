require 'spec_helper'

describe FH::Company::Availability do
  it 'exists' do
    expect FH::Company::Availability
  end

  it 'responds to methods' do
    availability = FH::Company::Availability.new(
      capacity: 10,
      customer_type_rates: [15, 10],
      custom_field_instances: "",
      item: { pk: 1867, name: "do the thing" },
      pk: 4787,
      start_at: "2015-01-22T11:30:00-1000",
      end_at: "2015-01-22T13:30:00-1000"
     )

    expect(availability).to respond_to :capacity
    expect(availability).to respond_to :customer_type_rates
    expect(availability).to respond_to :custom_field_instances
    expect(availability).to respond_to :item
    expect(availability).to respond_to :pk
    expect(availability).to respond_to :start_at
    expect(availability).to respond_to :end_at
  end
end
