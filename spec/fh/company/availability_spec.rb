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

    expect(availability.capacity).to eq 10
    expect(availability.customer_type_rates).to eq [15, 10]
    expect(availability.custom_field_instances).to eq ""
    expect(availability.item).to eq({ pk: 1867, name: "do the thing" })
    expect(availability.pk).to eq 4787
    expect(availability.start_at).to eq "2015-01-22T11:30:00-1000"
    expect(availability.end_at).to eq "2015-01-22T13:30:00-1000"
  end
end
