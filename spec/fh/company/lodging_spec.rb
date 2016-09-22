require 'spec_helper'

describe FH::Company::Lodging do
  it 'exists' do
    expect FH::Company::Lodging
  end

  it 'can create a lodging' do
    data = {
      "pk": 231,
      "name": "Wyndham Royal Garden",
      "phone": "(808) 943-0202",
      "address": "440 Olohana St Honolulu, HI 96815",
      "url": "https:\/\/www.extraholidays.com\/honolulu-hawaii\/royal-garden-at-waikiki.aspx",
      "is_self_lodging": false
    }
    lodging = FH::Company::Lodging.new(data)

    expect(lodging.class).to eq FH::Company::Lodging
    expect(lodging.name).to eq "Wyndham Royal Garden"
    expect(lodging.is_self_lodging).to eq false
    expect(lodging.url).to eq "https:\/\/www.extraholidays.com\/honolulu-hawaii\/royal-garden-at-waikiki.aspx"
    expect(lodging.phone).to eq "(808) 943-0202"
    expect(lodging.address).to eq "440 Olohana St Honolulu, HI 96815"
    expect(lodging.pk).to eq 231
    expect(lodging.is_pickup_available).to eq nil
  end
end
