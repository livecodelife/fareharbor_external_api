require 'spec_helper'

describe FH::Companies do
  it 'exists' do
    expect FH::Companies
  end

  it 'retrieves all companies' do
    VCR.use_cassette('companies#all') do
      companies = FH::Companies.all
      company = companies.first

      expect(companies.count).to eq 3
      expect(companies.class).to eq Array
      expect(company.shortname).to eq('bodyglove')
      expect(company.name).to eq('Body Glove')
    end
  end

  it "finds a company by shortname" do
    VCR.use_cassette('companies#find') do
      company = FH::Companies.find('bodyglove')

      expect(company.class).to eq FH::Company
      expect(company.shortname).to eq('bodyglove')
      expect(company.name).to eq('Body Glove')
    end
  end
end
