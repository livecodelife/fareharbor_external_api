require 'spec_helper'

describe FareHarbor::Affiliate::Companies do
  it 'exists' do
    expect FareHarbor::Affiliate::Companies
  end

  it 'retrieves all companies' do
    VCR.use_cassette('companies#all') do
      companies_hash = FareHarbor::Affiliate::Companies.all
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
      items_hash = FareHarbor::Affiliate::Companies.items('islandsailing')
      items = items_hash['items']
      item = items.first

      expect(items_hash.class).to eq Hash
      expect(items.class).to eq Array
      expect(item['name']).to eq('1 Hr Sailboat Tour')
      expect(item['location']).to eq('San Francisco Bay')
    end
  end
end
