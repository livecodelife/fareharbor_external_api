require 'spec_helper'

describe FareHarbor::Affiliate::Companies do
  it 'exists' do
    expect FareHarbor::Affiliate::Companies
  end

  it 'retrieves all companies' do
    VCR.use_cassette('companies#all') do
      companies_hash = FareHarbor::Affiliate::Companies.all
      companies = companies_hash["companies"]

      expect(companies.count).to eq 3
      expect(companies_hash.class).to eq Hash
      expect(companies.class).to eq Array
      expect(companies.first.keys).to eq(["shortname", "name"])
      expect(companies.first["shortname"]).to eq("bodyglove")
      expect(companies.first["name"]).to eq("Body Glove")
    end
  end
end
