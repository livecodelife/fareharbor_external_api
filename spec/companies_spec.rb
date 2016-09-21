require 'spec_helper'

describe FH::Companies do
  it 'exists' do
    expect FH::Companies
  end

  it 'retrieves all companies' do
    companies = FH::Companies.all
    company = companies.first

    expect(companies.count).to eq 3
    expect(companies.class).to eq Array
    expect(company.shortname).to eq('bodyglove')
    expect(company.name).to eq('Body Glove')
  end

  it "finds a company by shortname" do
    company = FH::Companies.find('bodyglove')

    expect(company.class).to eq FH::Company
    expect(company.shortname).to eq('bodyglove')
    expect(company.name).to eq('Body Glove')
  end
end
