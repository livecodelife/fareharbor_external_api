require 'spec_helper'

describe FH::Company::Item do
  it 'exists' do
    expect FH::Company::Item
  end

  it 'can create a new item' do
    VCR.use_cassette('company#items') do
      company = FH::Companies.find('islandsailing')
      items   = company.items
      item    = items.first

      expect(item.class).to eq FH::Company::Item
      expect(item).to respond_to :image_cdn_url
      expect(item).to respond_to :name
      expect(item).to respond_to :cancellation_policy_safe_html
      expect(item).to respond_to :headline
      expect(item).to respond_to :cancellation_policy
      expect(item).to respond_to :is_pickup_ever_available
      expect(item).to respond_to :description_safe_html
      expect(item).to respond_to :location
      expect(item).to respond_to :customer_prototypes
      expect(item).to respond_to :images
      expect(item).to respond_to :pk
      expect(item).to respond_to :tax_percentage
      expect(item).to respond_to :description
    end
  end
end
