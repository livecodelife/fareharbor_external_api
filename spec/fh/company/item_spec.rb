require 'spec_helper'

describe FH::Company::Item do
  it 'exists' do
    expect FH::Company::Item
  end

  it 'can create a new item' do
    data = {
      "pk": 1867,
      "name": "Jet Ski Tour",
      "headline": "Epic Jet Ski Tour",
      "description": "See Honolulu from a jet ski!",
      "description_safe_html": "\u003cp\u003eSee Honolulu from a jet ski!\u003c\/p\u003e",
      "cancellation_policy": "A full refund will be issued if notice is given at least 24 hours before start time.",
      "cancellation_policy_safe_html": "\u003cp\u003eA full refund will be issued if notice is given at least 24 hours before start time.\u003c\/p\u003e",
      "location": "Honolulu, HI",
      "is_pickup_ever_available": true,
      "image_cdn_url": "https:\/\/d1a2dkr8rai8e2.cloudfront.net\/api\/file\/rvybRyLWTgyV5w4xg42p\/",
      "images": [
        {
          "pk": 687,
          "gallery": "carousel",
          "image_cdn_url": "https:\/\/d1a2dkr8rai8e2.cloudfront.net\/api\/file\/rvybRyLWTgyV5w4xg42p\/"
        }
      ],
      "customer_prototypes": [
        {
          "pk": 2522,
          "display_name": "Adult"
        }
      ]
    }

    item = FH::Company::Item.new(data)
    images = [
      {
        "pk": 687,
        "gallery": "carousel",
        "image_cdn_url": "https:\/\/d1a2dkr8rai8e2.cloudfront.net\/api\/file\/rvybRyLWTgyV5w4xg42p\/"
      }
    ]
    customer_prototypes = [
      {
        "pk": 2522,
        "display_name": "Adult"
      }
    ]

    expect(item.class).to eq FH::Company::Item
    expect(item.pk).to eq 1867
    expect(item.name).to eq "Jet Ski Tour"
    expect(item.headline).to eq "Epic Jet Ski Tour"
    expect(item.description).to eq "See Honolulu from a jet ski!"
    expect(item.description_safe_html).to eq "\u003cp\u003eSee Honolulu from a jet ski!\u003c\/p\u003e"
    expect(item.cancellation_policy).to eq "A full refund will be issued if notice is given at least 24 hours before start time."
    expect(item.cancellation_policy_safe_html).to eq "\u003cp\u003eA full refund will be issued if notice is given at least 24 hours before start time.\u003c\/p\u003e"
    expect(item.location).to eq "Honolulu, HI"
    expect(item.is_pickup_ever_available).to eq true
    expect(item.image_cdn_url).to eq "https:\/\/d1a2dkr8rai8e2.cloudfront.net\/api\/file\/rvybRyLWTgyV5w4xg42p\/"
    expect(item.images).to eq images
    expect(item.customer_prototypes).to eq customer_prototypes
  end
end
