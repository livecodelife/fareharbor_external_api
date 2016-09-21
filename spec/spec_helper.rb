require 'simplecov'
SimpleCov.start
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require './lib/fareharbor_external_api'
require 'webmock/rspec'

WebMock.disable_net_connect!(allow_localhost: true)
app_key = ENV['FAREHARBOR_API_APP_KEY']
user_key = ENV['FAREHARBOR_API_USER_KEY']

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, "https://demo.fareharbor.com/api/external/v1/companies/?api-app=#{app_key}&api-user=#{user_key}").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.9.2'}).
         to_return(:status => 200, :body => '{
                    "companies": [
                                  {
                                    "shortname": "bodyglove",
                                    "name": "Body Glove"
                                  },
                                  {
                                    "shortname": "islandsailing",
                                    "name": "Island Sailing"
                                  },
                                  {
                                    "shortname": "sharktourshawaii",
                                    "name": "North Shore Shark Adventures"
                                  }
                                ]
                                }', :headers => {})
  end
end

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, "https://demo.fareharbor.com/api/external/v1/companies/islandsailing/items/?api-app=#{app_key}&api-user=#{user_key}").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.9.2'}).
         to_return(:status => 200, :body => '{
                              "items": [
                                {
                                  "image_cdn_url": "https://d1a2dkr8rai8e2.cloudfront.net/api/file/ojL9kbugT7W5sOVUWZsO",
                                  "name": "1 Hr Sailboat Tour",
                                  "cancellation_policy_safe_html": "<p>1 HR SAILBOAT TOUR CANCELLATION POLICY: Customers will receive a full refund with 24 hours notice of cancellation. Customers will also receive a full refund in case of operator cancellation due to weather or other unforeseen circumstances. Contact us by phone to cancel or inquire about a cancellation. No-shows will be charged the full price.</p>",
                                  "headline": "",
                                  "cancellation_policy": "1 HR SAILBOAT TOUR CANCELLATION POLICY: Customers will receive a full refund with 24 hours notice of cancellation. Customers will also receive a full refund in case of operator cancellation due to weather or other unforeseen circumstances. Contact us by phone to cancel or inquire about a cancellation. No-shows will be charged the full price.",
                                  "is_pickup_ever_available": true,
                                  "description_safe_html": "<p>Take a sailboat tour around the bay!</p>\n<p>Here\'s a website: <a href=\"http://apple.com\" target=\"_new\">http://apple.com</a></p>",
                                  "location": "San Francisco Bay",
                                  "customer_prototypes": [
                                    {
                                      "pk": 2271,
                                      "display_name": "Adult"
                                    },
                                    {
                                      "pk": 2272,
                                      "display_name": "Child"
                                    },
                                    {
                                      "pk": 2656,
                                      "display_name": "Private charter"
                                    }
                                  ],
                                  "images": [],
                                  "pk": 1021,
                                  "tax_percentage": 7.7122,
                                  "description": "Take a sailboat tour around the bay!\n\nHere\'s a website: <http://apple.com>"
                                }
                              ]
                            }', :headers => {})

  end
end

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, "https://demo.fareharbor.com/api/external/v1/companies/sharktourshawaii/items/1108/minimal/availabilities/date/2016-11-14/?api-app=#{app_key}&api-user=#{user_key}").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.9.2'}).
         to_return(:status => 200, :body => '{
  "availabilities": [
    {
      "start_at": "2016-11-14T07:00:00-1000",
      "pk": 435426,
      "capacity": 18,
      "customer_type_rates": [
        {
          "pk": 1044260,
          "customer_type": {
            "note": "",
            "pk": 1853,
            "plural": "Adult cage divers",
            "singular": "Adult cage diver"
          },
          "capacity": 18,
          "customer_prototype": {
            "pk": 2522,
            "display_name": "Adult cage diver"
          }
        },
        {
          "pk": 1044261,
          "customer_type": {
            "note": "",
            "pk": 1854,
            "plural": "Child cage diver",
            "singular": "Child cage diver"
          },
          "capacity": 18,
          "customer_prototype": {
            "pk": 2523,
            "display_name": "Child cage diver"
          }
        },
        {
          "pk": 1044262,
          "customer_type": {
            "note": "",
            "pk": 1855,
            "plural": "Adult boat rider",
            "singular": "Adult boat rider"
          },
          "capacity": 18,
          "customer_prototype": {
            "pk": 2524,
            "display_name": "Adult boat rider"
          }
        },
        {
          "pk": 1044263,
          "customer_type": {
            "note": "",
            "pk": 1856,
            "plural": "Child boat rider",
            "singular": "Child boat rider"
          },
          "capacity": 18,
          "customer_prototype": {
            "pk": 2525,
            "display_name": "Child boat rider"
          }
        },
        {
          "pk": 1044264,
          "customer_type": {
            "note": "",
            "pk": 1857,
            "plural": "Infant boat rider",
            "singular": "Infant boat rider"
          },
          "capacity": 18,
          "customer_prototype": {
            "pk": 2526,
            "display_name": "Infant boat rider"
          }
        },
        {
          "pk": 1044265,
          "customer_type": {
            "note": "",
            "pk": 1858,
            "plural": "Adult cage driver (kama\'aina/military)",
            "singular": "Adult cage driver (kama\'aina/military)"
          },
          "capacity": 18,
          "customer_prototype": {
            "pk": 2527,
            "display_name": "Adult cage driver (kama\'aina/military)"
          }
        }
      ],
      "end_at": "2016-11-14T08:30:00-1000"
    }
  ]
}', :headers => {})
  end
end

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, "https://demo.fareharbor.com/api/external/v1/companies/sharktourshawaii/items/1108/minimal/availabilities/date-range/2016-11-14/2016-11-17/?api-app=#{app_key}&api-user=#{user_key}").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.9.2'}).
         to_return(:status => 200, :body => '{
  "availabilities": [
    {
      "start_at": "2016-11-14T07:00:00-1000",
      "pk": 435426,
      "capacity": 18,
      "customer_type_rates": [
        {
          "pk": 1044260,
          "customer_type": {
            "note": "",
            "pk": 1853,
            "plural": "Adult cage divers",
            "singular": "Adult cage diver"
          },
          "capacity": 18,
          "customer_prototype": {
            "pk": 2522,
            "display_name": "Adult cage diver"
          }
        },
        {
          "pk": 1044261,
          "customer_type": {
            "note": "",
            "pk": 1854,
            "plural": "Child cage diver",
            "singular": "Child cage diver"
          },
          "capacity": 18,
          "customer_prototype": {
            "pk": 2523,
            "display_name": "Child cage diver"
          }
        },
        {
          "pk": 1044262,
          "customer_type": {
            "note": "",
            "pk": 1855,
            "plural": "Adult boat rider",
            "singular": "Adult boat rider"
          },
          "capacity": 18,
          "customer_prototype": {
            "pk": 2524,
            "display_name": "Adult boat rider"
          }
        },
        {
          "pk": 1044263,
          "customer_type": {
            "note": "",
            "pk": 1856,
            "plural": "Child boat rider",
            "singular": "Child boat rider"
          },
          "capacity": 18,
          "customer_prototype": {
            "pk": 2525,
            "display_name": "Child boat rider"
          }
        },
        {
          "pk": 1044264,
          "customer_type": {
            "note": "",
            "pk": 1857,
            "plural": "Infant boat rider",
            "singular": "Infant boat rider"
          },
          "capacity": 18,
          "customer_prototype": {
            "pk": 2526,
            "display_name": "Infant boat rider"
          }
        },
        {
          "pk": 1044265,
          "customer_type": {
            "note": "",
            "pk": 1858,
            "plural": "Adult cage driver (kama\'aina/military)",
            "singular": "Adult cage driver (kama\'aina/military)"
          },
          "capacity": 18,
          "customer_prototype": {
            "pk": 2527,
            "display_name": "Adult cage driver (kama\'aina/military)"
          }
        }
      ],
      "end_at": "2016-11-14T08:30:00-1000"
    }
  ]
}', :headers => {})
  end
end

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, "https://demo.fareharbor.com/api/external/v1/companies/bodyglove/availabilities/70050/?api-app=#{app_key}&api-user=#{user_key}").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.9.2'}).
         to_return(:status => 200, :body => '{
  "availability": {
    "capacity": 116,
    "customer_type_rates": [
      {
        "customer_prototype": {
          "pk": 287,
          "display_name": "Adults (18 and up)"
        },
        "capacity": 116,
        "custom_field_instances": [],
        "customer_type": {
          "note": "18 and up",
          "pk": 298,
          "plural": "Adults",
          "singular": "Adult"
        },
        "pk": 149140,
        "total": 13200
      },
      {
        "customer_prototype": {
          "pk": 3109,
          "display_name": "Adult Coupons"
        },
        "capacity": 116,
        "custom_field_instances": [],
        "customer_type": {
          "note": "",
          "pk": 297,
          "plural": "Adult Coupons",
          "singular": "Adult Coupon"
        },
        "pk": 1161726,
        "total": 12200
      },
      {
        "customer_prototype": {
          "pk": 288,
          "display_name": "Children (Ages 6- 17) Must be accompanied by 18+ Adult"
        },
        "capacity": 116,
        "custom_field_instances": [],
        "customer_type": {
          "note": "(Ages 6- 17) Must be accompanied by 18+ Adult",
          "pk": 299,
          "plural": "Children",
          "singular": "Child"
        },
        "pk": 149141,
        "total": 8800
      },
      {
        "customer_prototype": {
          "pk": 289,
          "display_name": "Infants (5 and younger)"
        },
        "capacity": 116,
        "custom_field_instances": [],
        "customer_type": {
          "note": "5 and younger",
          "pk": 321,
          "plural": "Infants",
          "singular": "Infant"
        },
        "pk": 1161863,
        "total": 0
      },
      {
        "customer_prototype": {
          "pk": 3110,
          "display_name": "Ride along"
        },
        "capacity": 116,
        "custom_field_instances": [],
        "customer_type": {
          "note": "",
          "pk": 300,
          "plural": "Ride Alongs",
          "singular": "Ride Along"
        },
        "pk": 1161980,
        "total": 8800
      }
    ],
    "custom_field_instances": [
      {
        "pk": 4553,
        "custom_field": {
          "modifier_type": "none",
          "description": "",
          "booking_notes_safe_html": "",
          "extended_options": [
            {
              "name": "101 Things To Do",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39982,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Activity Desk",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39983,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Hilton Waikoloa Briefing",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39984,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Macaroni Grill Pleasant Briefing",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39985,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Raintree Kona Reef Briefing",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39986,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Royal Kona Resort Pleasant Briefing",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39987,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Big Island Visitor Magazine",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39988,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Big Island Revealed",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39989,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Kings\' Shops & Waikoloa Beach Marriott VIP Card",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39990,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Kona Bali Kai",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39991,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "KBI Stroll",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39992,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Internet search",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 7178,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Yelp",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 7179,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "TripAdvisor",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 7180,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Google+",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 7181,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Facebook",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 7182,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Instagram",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 7183,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Twitter",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 7184,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Friend",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 7185,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Word of mouth",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 7186,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Other",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 7187,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Brochure",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39993,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            }
          ],
          "is_taxable": true,
          "modifier_kind": "offset",
          "description_safe_html": "",
          "booking_notes": "",
          "offset": 0,
          "pk": 720,
          "percentage": 0,
          "is_required": false,
          "type": "extended-option",
          "is_always_per_customer": false,
          "name": "How did you hear about Body Glove?"
        }
      },
      {
        "pk": 4557,
        "custom_field": {
          "modifier_type": "none",
          "description": "",
          "booking_notes_safe_html": "",
          "extended_options": [
            {
              "name": "Yes!",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 40044,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "No Thank You",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 40045,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            }
          ],
          "is_taxable": true,
          "modifier_kind": "offset",
          "description_safe_html": "",
          "booking_notes": "",
          "offset": 0,
          "pk": 4480,
          "percentage": 0,
          "is_required": false,
          "type": "extended-option",
          "is_always_per_customer": false,
          "name": "Are you interested in SCUBA? ($105/Discover SCUBA) ($95/Certified Diver)"
        }
      }
    ],
    "item": {
      "pk": 183,
      "name": "Snorkel & Dolphin Adventure"
    },
    "pk": 70050,
    "start_at": "2016-11-24T08:00:00-1000",
    "end_at": "2016-11-24T12:30:00-1000"
  }
}', :headers => {})
  end
end

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, "https://demo.fareharbor.com/api/external/v1/companies/bodyglove/bookings/85ab9e4c-03fd-4bd4-af67-4946aa426c79/?api-app=#{app_key}&api-user=#{user_key}").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.9.2'}).
         to_return(:status => 200, :body => '{
  "booking": {
    "display_id": "#16604",
    "status": "cancelled",
    "customers": [
      {
        "pk": 57296,
        "custom_field_values": [],
        "customer_type_rate": {
          "pk": 149126,
          "customer_type": {
            "note": "18 and up",
            "pk": 298,
            "plural": "Adults",
            "singular": "Adult"
          },
          "total": 13200,
          "capacity": 0,
          "customer_prototype": {
            "pk": 287,
            "display_name": "Adults (18 and up)"
          }
        }
      },
      {
        "pk": 57297,
        "custom_field_values": [],
        "customer_type_rate": {
          "pk": 149126,
          "customer_type": {
            "note": "18 and up",
            "pk": 298,
            "plural": "Adults",
            "singular": "Adult"
          },
          "total": 13200,
          "capacity": 0,
          "customer_prototype": {
            "pk": 287,
            "display_name": "Adults (18 and up)"
          }
        }
      }
    ],
    "uuid": "85ab9e4c-03fd-4bd4-af67-4946aa426c79",
    "receipt_taxes": 1987,
    "note_safe_html": "<p>Optional booking note</p>",
    "receipt_subtotal": 26400,
    "arrival": {
      "display_text": "Please arrive by 7:45am",
      "notes": "**Boarding is 30 minutes prior to departure time** at the Kailua Pier.\n\n**ALERT!**\nDue to heavy traffic and road construction, please allow extra drive time for traffic delays. The following are the current suggested drive times:\nKailua-Kona - 30 Minutes\nKeauhou - 1 Hour\nWaikoloa Resorts - 1.5 Hours\nHilo & Volcano - 3 Hours\n\nThe Kailua Pier is located in the heart of downtown Kailua Kona, ocean front of the King Kamehameha Courtyard Marriott Kona Beach Hotel. \n\n**Free parking is available at the Body Glove office a block up from the pier.** \n\n[![Get directions](https://d1a2dkr8rai8e2.cloudfront.net/api/file/zHkp5PxGQf69fkfcaXvg)](https://goo.gl/maps/BwRre)",
      "notes_safe_html": "<p><strong>Boarding is 30 minutes prior to departure time</strong> at the Kailua Pier.</p>\n<p><strong>ALERT!</strong><br>\nDue to heavy traffic and road construction, please allow extra drive time for traffic delays. The following are the current suggested drive times:<br>\nKailua-Kona - 30 Minutes<br>\nKeauhou - 1 Hour<br>\nWaikoloa Resorts - 1.5 Hours<br>\nHilo &amp; Volcano - 3 Hours</p>\n<p>The Kailua Pier is located in the heart of downtown Kailua Kona, ocean front of the King Kamehameha Courtyard Marriott Kona Beach Hotel. </p>\n<p><strong>Free parking is available at the Body Glove office a block up from the pier.</strong> </p>\n<p><a href=\"https://goo.gl/maps/BwRre\" target=\"_new\"><img alt=\"Get directions\" src=\"https://d1a2dkr8rai8e2.cloudfront.net/api/file/zHkp5PxGQf69fkfcaXvg\"></a></p>",
      "time": "2016-11-15T07:45:00-1000"
    },
    "rebooked_to": null,
    "confirmation_url": "https://demo.fareharbor.com/embeds/book/bodyglove/items/183/booking/85ab9e4c-03fd-4bd4-af67-4946aa426c79/",
    "note": "Optional booking note",
    "pickup": null,
    "contact": {
      "phone": "123-456-7890",
      "name": "John Doe",
      "email": "johndoe@example.com"
    },
    "invoice_price": 28387,
    "receipt_total": 28387,
    "custom_field_values": [
      {
        "pk": 38824,
        "custom_field": {
          "modifier_type": "none",
          "description": "",
          "booking_notes_safe_html": "",
          "extended_options": [
            {
              "name": "Yes!",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 40044,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "No Thank You",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 40045,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            }
          ],
          "is_taxable": true,
          "modifier_kind": "offset",
          "description_safe_html": "",
          "booking_notes": "",
          "offset": 0,
          "pk": 4480,
          "percentage": 0,
          "is_required": false,
          "type": "extended-option",
          "is_always_per_customer": false,
          "name": "Are you interested in SCUBA? ($105/Discover SCUBA) ($95/Certified Diver)"
        },
        "value": ""
      },
      {
        "pk": 38826,
        "custom_field": {
          "modifier_type": "none",
          "description": "",
          "booking_notes_safe_html": "",
          "extended_options": [
            {
              "name": "101 Things To Do",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39982,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Activity Desk",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39983,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Hilton Waikoloa Briefing",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39984,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Macaroni Grill Pleasant Briefing",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39985,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Raintree Kona Reef Briefing",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39986,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Royal Kona Resort Pleasant Briefing",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39987,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Big Island Visitor Magazine",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39988,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Big Island Revealed",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39989,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Kings\' Shops & Waikoloa Beach Marriott VIP Card",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39990,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Kona Bali Kai",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39991,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "KBI Stroll",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39992,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Internet search",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 7178,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Yelp",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 7179,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "TripAdvisor",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 7180,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Google+",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 7181,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Facebook",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 7182,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Instagram",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 7183,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Twitter",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 7184,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Friend",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 7185,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Word of mouth",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 7186,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Other",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 7187,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Brochure",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39993,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            }
          ],
          "is_taxable": true,
          "modifier_kind": "offset",
          "description_safe_html": "",
          "booking_notes": "",
          "offset": 0,
          "pk": 720,
          "percentage": 0,
          "is_required": false,
          "type": "extended-option",
          "is_always_per_customer": false,
          "name": "How did you hear about Body Glove?"
        },
        "value": ""
      }
    ],
    "pk": 16604,
    "rebooked_from": null,
    "external_id": "",
    "availability": {
      "capacity": 0,
      "start_at": "2016-11-15T08:00:00-1000",
      "custom_field_instances": [
        {
          "pk": 4553,
          "custom_field": {
            "is_required": false,
            "description": "",
            "booking_notes_safe_html": "",
            "type": "extended-option",
            "is_taxable": true,
            "modifier_kind": "offset",
            "description_safe_html": "",
            "booking_notes": "",
            "offset": 0,
            "pk": 720,
            "percentage": 0,
            "modifier_type": "none",
            "extended_options": [
              {
                "name": "101 Things To Do",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 39982,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Activity Desk",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 39983,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Hilton Waikoloa Briefing",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 39984,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Macaroni Grill Pleasant Briefing",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 39985,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Raintree Kona Reef Briefing",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 39986,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Royal Kona Resort Pleasant Briefing",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 39987,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Big Island Visitor Magazine",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 39988,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Big Island Revealed",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 39989,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Kings\' Shops & Waikoloa Beach Marriott VIP Card",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 39990,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Kona Bali Kai",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 39991,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "KBI Stroll",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 39992,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Internet search",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 7178,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Yelp",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 7179,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "TripAdvisor",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 7180,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Google+",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 7181,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Facebook",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 7182,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Instagram",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 7183,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Twitter",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 7184,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Friend",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 7185,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Word of mouth",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 7186,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Other",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 7187,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Brochure",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 39993,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              }
            ],
            "is_always_per_customer": false,
            "name": "How did you hear about Body Glove?"
          }
        },
        {
          "pk": 4557,
          "custom_field": {
            "is_required": false,
            "description": "",
            "booking_notes_safe_html": "",
            "type": "extended-option",
            "is_taxable": true,
            "modifier_kind": "offset",
            "description_safe_html": "",
            "booking_notes": "",
            "offset": 0,
            "pk": 4480,
            "percentage": 0,
            "modifier_type": "none",
            "extended_options": [
              {
                "name": "Yes!",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 40044,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "No Thank You",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 40045,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              }
            ],
            "is_always_per_customer": false,
            "name": "Are you interested in SCUBA? ($105/Discover SCUBA) ($95/Certified Diver)"
          }
        }
      ],
      "item": {
        "pk": 183,
        "name": "Snorkel & Dolphin Adventure"
      },
      "pk": 70043,
      "customer_type_rates": [
        {
          "customer_prototype": {
            "pk": 287,
            "display_name": "Adults (18 and up)"
          },
          "capacity": 0,
          "custom_field_instances": [],
          "customer_type": {
            "note": "18 and up",
            "pk": 298,
            "plural": "Adults",
            "singular": "Adult"
          },
          "pk": 149126,
          "total": 13200
        },
        {
          "customer_prototype": {
            "pk": 3109,
            "display_name": "Adult Coupons"
          },
          "capacity": 0,
          "custom_field_instances": [],
          "customer_type": {
            "note": "",
            "pk": 297,
            "plural": "Adult Coupons",
            "singular": "Adult Coupon"
          },
          "pk": 1161719,
          "total": 12200
        },
        {
          "customer_prototype": {
            "pk": 288,
            "display_name": "Children (Ages 6- 17) Must be accompanied by 18+ Adult"
          },
          "capacity": 0,
          "custom_field_instances": [],
          "customer_type": {
            "note": "(Ages 6- 17) Must be accompanied by 18+ Adult",
            "pk": 299,
            "plural": "Children",
            "singular": "Child"
          },
          "pk": 149127,
          "total": 8800
        },
        {
          "customer_prototype": {
            "pk": 289,
            "display_name": "Infants (5 and younger)"
          },
          "capacity": 0,
          "custom_field_instances": [],
          "customer_type": {
            "note": "5 and younger",
            "pk": 321,
            "plural": "Infants",
            "singular": "Infant"
          },
          "pk": 1161856,
          "total": 0
        },
        {
          "customer_prototype": {
            "pk": 3110,
            "display_name": "Ride along"
          },
          "capacity": 0,
          "custom_field_instances": [],
          "customer_type": {
            "note": "",
            "pk": 300,
            "plural": "Ride Alongs",
            "singular": "Ride Along"
          },
          "pk": 1161973,
          "total": 8800
        }
      ],
      "end_at": "2016-11-15T12:30:00-1000"
    },
    "voucher_number": "VN-123456"
  }
}', :headers => {})
  end
end

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, "https://demo.fareharbor.com/api/external/v1/companies/bodyglove/lodgings/?api-app=#{app_key}&api-user=#{user_key}").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.9.2'}).
         to_return(:status => 200, :body => '{
  "lodgings": [
    {
      "name": "Alii Cove",
      "is_self_lodging": false,
      "url": "",
      "phone": "",
      "address": "",
      "pk": 555
    }
  ]
}', :headers => {})
  end
end

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, "https://demo.fareharbor.com/api/external/v1/companies/bodyglove/availabilities/70050/lodgings/?api-app=#{app_key}&api-user=#{user_key}").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.9.2'}).
         to_return(:status => 200, :body => '{
  "lodgings": [
    {
      "pk": 637,
      "is_pickup_available": false,
      "name": "WorldMark by Wyndham"
    }
  ]
}', :headers => {})
  end
end

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:post, "https://demo.fareharbor.com/api/external/v1/companies/bodyglove/availabilities/70042/bookings/?api-app=#{app_key}&api-user=#{user_key}").
         with(:body => "{\"voucher_number\":\"VN-123456\",\"contact\":{\"name\":\"John Doe\",\"phone\":\"415-789-4563\",\"email\":\"johndoe@example.com\"},\"customers\":[{\"customer_type_rate\":149124},{\"customer_type_rate\":149124}],\"note\":\"Optional booking note\"}",
              :headers => {'Accept'=>'*/*',
                 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'User-Agent'=>'Faraday v0.9.2'}).
         to_return(:status => 200, :body => '{
  "booking": {
    "display_id": "#17081",
    "status": "booked",
    "customers": [
      {
        "pk": 58795,
        "custom_field_values": [],
        "customer_type_rate": {
          "pk": 149124,
          "customer_type": {
            "note": "18 and up",
            "pk": 298,
            "plural": "Adults",
            "singular": "Adult"
          },
          "total": 13200,
          "capacity": 114,
          "customer_prototype": {
            "pk": 287,
            "display_name": "Adults (18 and up)"
          }
        }
      },
      {
        "pk": 58796,
        "custom_field_values": [],
        "customer_type_rate": {
          "pk": 149124,
          "customer_type": {
            "note": "18 and up",
            "pk": 298,
            "plural": "Adults",
            "singular": "Adult"
          },
          "total": 13200,
          "capacity": 114,
          "customer_prototype": {
            "pk": 287,
            "display_name": "Adults (18 and up)"
          }
        }
      }
    ],
    "uuid": "6de87e32-522e-468d-bb22-5e28d24d340b",
    "receipt_taxes": 1987,
    "note_safe_html": "<p>Optional booking note</p>",
    "receipt_subtotal": 26400,
    "arrival": {
      "display_text": "Please arrive by 7:45am",
      "notes": "**Boarding is 30 minutes prior to departure time** at the Kailua Pier.\n\n**ALERT!**\nDue to heavy traffic and road construction, please allow extra drive time for traffic delays. The following are the current suggested drive times:\nKailua-Kona - 30 Minutes\nKeauhou - 1 Hour\nWaikoloa Resorts - 1.5 Hours\nHilo & Volcano - 3 Hours\n\nThe Kailua Pier is located in the heart of downtown Kailua Kona, ocean front of the King Kamehameha Courtyard Marriott Kona Beach Hotel. \n\n**Free parking is available at the Body Glove office a block up from the pier.** \n\n[![Get directions](https://d1a2dkr8rai8e2.cloudfront.net/api/file/zHkp5PxGQf69fkfcaXvg)](https://goo.gl/maps/BwRre)",
      "notes_safe_html": "<p><strong>Boarding is 30 minutes prior to departure time</strong> at the Kailua Pier.</p>\n<p><strong>ALERT!</strong><br>\nDue to heavy traffic and road construction, please allow extra drive time for traffic delays. The following are the current suggested drive times:<br>\nKailua-Kona - 30 Minutes<br>\nKeauhou - 1 Hour<br>\nWaikoloa Resorts - 1.5 Hours<br>\nHilo &amp; Volcano - 3 Hours</p>\n<p>The Kailua Pier is located in the heart of downtown Kailua Kona, ocean front of the King Kamehameha Courtyard Marriott Kona Beach Hotel. </p>\n<p><strong>Free parking is available at the Body Glove office a block up from the pier.</strong> </p>\n<p><a href=\"https://goo.gl/maps/BwRre\" target=\"_new\"><img alt=\"Get directions\" src=\"https://d1a2dkr8rai8e2.cloudfront.net/api/file/zHkp5PxGQf69fkfcaXvg\"></a></p>",
      "time": "2016-11-14T07:45:00-1000"
    },
    "rebooked_to": null,
    "confirmation_url": "https://demo.fareharbor.com/embeds/book/bodyglove/items/183/booking/6de87e32-522e-468d-bb22-5e28d24d340b/",
    "note": "Optional booking note",
    "pickup": null,
    "contact": {
      "phone": "415-789-4563",
      "name": "John Doe",
      "email": "johndoe@example.com"
    },
    "invoice_price": 28387,
    "receipt_total": 28387,
    "custom_field_values": [
      {
        "pk": 40917,
        "custom_field": {
          "is_required": false,
          "description": "",
          "booking_notes_safe_html": "",
          "type": "extended-option",
          "is_taxable": true,
          "modifier_kind": "offset",
          "description_safe_html": "",
          "booking_notes": "",
          "offset": 0,
          "pk": 720,
          "percentage": 0,
          "modifier_type": "none",
          "extended_options": [
            {
              "name": "101 Things To Do",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39982,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Activity Desk",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39983,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Hilton Waikoloa Briefing",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39984,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Macaroni Grill Pleasant Briefing",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39985,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Raintree Kona Reef Briefing",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39986,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Royal Kona Resort Pleasant Briefing",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39987,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Big Island Visitor Magazine",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39988,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Big Island Revealed",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39989,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Kings\' Shops & Waikoloa Beach Marriott VIP Card",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39990,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Kona Bali Kai",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39991,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "KBI Stroll",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39992,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Internet search",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 7178,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Yelp",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 7179,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "TripAdvisor",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 7180,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Google+",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 7181,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Facebook",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 7182,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Instagram",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 7183,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Twitter",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 7184,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Friend",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 7185,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Word of mouth",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 7186,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Other",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 7187,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Brochure",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39993,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            }
          ],
          "is_always_per_customer": false,
          "name": "How did you hear about Body Glove?"
        },
        "value": ""
      },
      {
        "pk": 40915,
        "custom_field": {
          "is_required": false,
          "description": "",
          "booking_notes_safe_html": "",
          "type": "extended-option",
          "is_taxable": true,
          "modifier_kind": "offset",
          "description_safe_html": "",
          "booking_notes": "",
          "offset": 0,
          "pk": 4480,
          "percentage": 0,
          "modifier_type": "none",
          "extended_options": [
            {
              "name": "Yes!",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 40044,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "No Thank You",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 40045,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            }
          ],
          "is_always_per_customer": false,
          "name": "Are you interested in SCUBA? ($105/Discover SCUBA) ($95/Certified Diver)"
        },
        "value": ""
      }
    ],
    "pk": 17081,
    "rebooked_from": null,
    "external_id": "",
    "availability": {
      "capacity": 114,
      "start_at": "2016-11-14T08:00:00-1000",
      "custom_field_instances": [
        {
          "pk": 4553,
          "custom_field": {
            "is_required": false,
            "description": "",
            "booking_notes_safe_html": "",
            "type": "extended-option",
            "is_taxable": true,
            "modifier_kind": "offset",
            "description_safe_html": "",
            "booking_notes": "",
            "offset": 0,
            "pk": 720,
            "percentage": 0,
            "modifier_type": "none",
            "extended_options": [
              {
                "name": "101 Things To Do",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 39982,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Activity Desk",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 39983,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Hilton Waikoloa Briefing",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 39984,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Macaroni Grill Pleasant Briefing",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 39985,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Raintree Kona Reef Briefing",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 39986,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Royal Kona Resort Pleasant Briefing",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 39987,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Big Island Visitor Magazine",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 39988,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Big Island Revealed",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 39989,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Kings\' Shops & Waikoloa Beach Marriott VIP Card",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 39990,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Kona Bali Kai",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 39991,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "KBI Stroll",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 39992,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Internet search",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 7178,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Yelp",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 7179,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "TripAdvisor",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 7180,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Google+",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 7181,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Facebook",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 7182,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Instagram",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 7183,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Twitter",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 7184,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Friend",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 7185,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Word of mouth",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 7186,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Other",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 7187,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Brochure",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 39993,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              }
            ],
            "is_always_per_customer": false,
            "name": "How did you hear about Body Glove?"
          }
        },
        {
          "pk": 4557,
          "custom_field": {
            "is_required": false,
            "description": "",
            "booking_notes_safe_html": "",
            "type": "extended-option",
            "is_taxable": true,
            "modifier_kind": "offset",
            "description_safe_html": "",
            "booking_notes": "",
            "offset": 0,
            "pk": 4480,
            "percentage": 0,
            "modifier_type": "none",
            "extended_options": [
              {
                "name": "Yes!",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 40044,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "No Thank You",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 40045,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              }
            ],
            "is_always_per_customer": false,
            "name": "Are you interested in SCUBA? ($105/Discover SCUBA) ($95/Certified Diver)"
          }
        }
      ],
      "item": {
        "pk": 183,
        "name": "Snorkel & Dolphin Adventure"
      },
      "pk": 70042,
      "customer_type_rates": [
        {
          "customer_prototype": {
            "pk": 287,
            "display_name": "Adults (18 and up)"
          },
          "capacity": 114,
          "custom_field_instances": [],
          "customer_type": {
            "note": "18 and up",
            "pk": 298,
            "plural": "Adults",
            "singular": "Adult"
          },
          "pk": 149124,
          "total": 13200
        },
        {
          "customer_prototype": {
            "pk": 3109,
            "display_name": "Adult Coupons"
          },
          "capacity": 114,
          "custom_field_instances": [],
          "customer_type": {
            "note": "",
            "pk": 297,
            "plural": "Adult Coupons",
            "singular": "Adult Coupon"
          },
          "pk": 1161718,
          "total": 12200
        },
        {
          "customer_prototype": {
            "pk": 288,
            "display_name": "Children (Ages 6- 17) Must be accompanied by 18+ Adult"
          },
          "capacity": 114,
          "custom_field_instances": [],
          "customer_type": {
            "note": "(Ages 6- 17) Must be accompanied by 18+ Adult",
            "pk": 299,
            "plural": "Children",
            "singular": "Child"
          },
          "pk": 149125,
          "total": 8800
        },
        {
          "customer_prototype": {
            "pk": 289,
            "display_name": "Infants (5 and younger)"
          },
          "capacity": 114,
          "custom_field_instances": [],
          "customer_type": {
            "note": "5 and younger",
            "pk": 321,
            "plural": "Infants",
            "singular": "Infant"
          },
          "pk": 1161855,
          "total": 0
        },
        {
          "customer_prototype": {
            "pk": 3110,
            "display_name": "Ride along"
          },
          "capacity": 114,
          "custom_field_instances": [],
          "customer_type": {
            "note": "",
            "pk": 300,
            "plural": "Ride Alongs",
            "singular": "Ride Along"
          },
          "pk": 1161972,
          "total": 8800
        }
      ],
      "end_at": "2016-11-14T12:30:00-1000"
    },
    "voucher_number": "VN-123456"
  }
}', :headers => {})
  end
end

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:post, "https://demo.fareharbor.com/api/external/v1/companies/bodyglove/availabilities/70042/bookings/validate/?api-app=#{app_key}&api-user=#{user_key}").
         with(:body => "{\"voucher_number\":\"VN-123456\",\"contact\":{\"name\":\"John Doe\",\"phone\":\"415-789-4563\",\"email\":\"johndoe@example.com\"},\"customers\":[{\"customer_type_rate\":149124},{\"customer_type_rate\":149124}],\"note\":\"Optional booking note\"}",
              :headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'User-Agent'=>'Faraday v0.9.2'}).
         to_return(:status => 200, :body => '{
  "invoice_price": 28387,
  "receipt_taxes": 1987,
  "receipt_subtotal": 26400,
  "pickup": null,
  "receipt_total": 28387,
  "is_bookable": true
}', :headers => {})
  end
end

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:delete, "https://demo.fareharbor.com/api/external/v1/companies/bodyglove/bookings/6de87e32-522e-468d-bb22-5e28d24d340b/?api-app=#{app_key}&api-user=#{user_key}").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.9.2'}).
         to_return(:status => 200, :body => '{
  "booking": {
    "display_id": "#17081",
    "status": "cancelled",
    "customers": [
      {
        "pk": 58795,
        "custom_field_values": [],
        "customer_type_rate": {
          "pk": 149124,
          "customer_type": {
            "note": "18 and up",
            "pk": 298,
            "plural": "Adults",
            "singular": "Adult"
          },
          "total": 13200,
          "capacity": 116,
          "customer_prototype": {
            "pk": 287,
            "display_name": "Adults (18 and up)"
          }
        }
      },
      {
        "pk": 58796,
        "custom_field_values": [],
        "customer_type_rate": {
          "pk": 149124,
          "customer_type": {
            "note": "18 and up",
            "pk": 298,
            "plural": "Adults",
            "singular": "Adult"
          },
          "total": 13200,
          "capacity": 116,
          "customer_prototype": {
            "pk": 287,
            "display_name": "Adults (18 and up)"
          }
        }
      }
    ],
    "uuid": "6de87e32-522e-468d-bb22-5e28d24d340b",
    "receipt_taxes": 1987,
    "note_safe_html": "<p>Optional booking note</p>",
    "receipt_subtotal": 26400,
    "arrival": {
      "display_text": "Please arrive by 7:45am",
      "notes": "**Boarding is 30 minutes prior to departure time** at the Kailua Pier.\n\n**ALERT!**\nDue to heavy traffic and road construction, please allow extra drive time for traffic delays. The following are the current suggested drive times:\nKailua-Kona - 30 Minutes\nKeauhou - 1 Hour\nWaikoloa Resorts - 1.5 Hours\nHilo & Volcano - 3 Hours\n\nThe Kailua Pier is located in the heart of downtown Kailua Kona, ocean front of the King Kamehameha Courtyard Marriott Kona Beach Hotel. \n\n**Free parking is available at the Body Glove office a block up from the pier.** \n\n[![Get directions](https://d1a2dkr8rai8e2.cloudfront.net/api/file/zHkp5PxGQf69fkfcaXvg)](https://goo.gl/maps/BwRre)",
      "notes_safe_html": "<p><strong>Boarding is 30 minutes prior to departure time</strong> at the Kailua Pier.</p>\n<p><strong>ALERT!</strong><br>\nDue to heavy traffic and road construction, please allow extra drive time for traffic delays. The following are the current suggested drive times:<br>\nKailua-Kona - 30 Minutes<br>\nKeauhou - 1 Hour<br>\nWaikoloa Resorts - 1.5 Hours<br>\nHilo &amp; Volcano - 3 Hours</p>\n<p>The Kailua Pier is located in the heart of downtown Kailua Kona, ocean front of the King Kamehameha Courtyard Marriott Kona Beach Hotel. </p>\n<p><strong>Free parking is available at the Body Glove office a block up from the pier.</strong> </p>\n<p><a href=\"https://goo.gl/maps/BwRre\" target=\"_new\"><img alt=\"Get directions\" src=\"https://d1a2dkr8rai8e2.cloudfront.net/api/file/zHkp5PxGQf69fkfcaXvg\"></a></p>",
      "time": "2016-11-14T07:45:00-1000"
    },
    "rebooked_to": null,
    "confirmation_url": "https://demo.fareharbor.com/embeds/book/bodyglove/items/183/booking/6de87e32-522e-468d-bb22-5e28d24d340b/",
    "note": "Optional booking note",
    "pickup": null,
    "contact": {
      "phone": "415-789-4563",
      "name": "John Doe",
      "email": "johndoe@example.com"
    },
    "invoice_price": 28387,
    "receipt_total": 28387,
    "custom_field_values": [
      {
        "pk": 40917,
        "custom_field": {
          "is_required": false,
          "description": "",
          "booking_notes_safe_html": "",
          "type": "extended-option",
          "is_taxable": true,
          "modifier_kind": "offset",
          "description_safe_html": "",
          "booking_notes": "",
          "offset": 0,
          "pk": 720,
          "percentage": 0,
          "modifier_type": "none",
          "extended_options": [
            {
              "name": "101 Things To Do",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39982,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Activity Desk",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39983,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Hilton Waikoloa Briefing",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39984,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Macaroni Grill Pleasant Briefing",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39985,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Raintree Kona Reef Briefing",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39986,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Royal Kona Resort Pleasant Briefing",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39987,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Big Island Visitor Magazine",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39988,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Big Island Revealed",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39989,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Kings\' Shops & Waikoloa Beach Marriott VIP Card",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39990,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Kona Bali Kai",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39991,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "KBI Stroll",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39992,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Internet search",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 7178,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Yelp",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 7179,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "TripAdvisor",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 7180,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Google+",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 7181,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Facebook",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 7182,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Instagram",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 7183,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Twitter",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 7184,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Friend",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 7185,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Word of mouth",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 7186,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Other",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 7187,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "Brochure",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 39993,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            }
          ],
          "is_always_per_customer": false,
          "name": "How did you hear about Body Glove?"
        },
        "value": ""
      },
      {
        "pk": 40915,
        "custom_field": {
          "is_required": false,
          "description": "",
          "booking_notes_safe_html": "",
          "type": "extended-option",
          "is_taxable": true,
          "modifier_kind": "offset",
          "description_safe_html": "",
          "booking_notes": "",
          "offset": 0,
          "pk": 4480,
          "percentage": 0,
          "modifier_type": "none",
          "extended_options": [
            {
              "name": "Yes!",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 40044,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            },
            {
              "name": "No Thank You",
              "is_taxable": true,
              "modifier_kind": "offset",
              "description_safe_html": "",
              "offset": 0,
              "pk": 40045,
              "percentage": 0,
              "modifier_type": "none",
              "is_always_per_customer": false,
              "description": ""
            }
          ],
          "is_always_per_customer": false,
          "name": "Are you interested in SCUBA? ($105/Discover SCUBA) ($95/Certified Diver)"
        },
        "value": ""
      }
    ],
    "pk": 17081,
    "rebooked_from": null,
    "external_id": "",
    "availability": {
      "capacity": 116,
      "start_at": "2016-11-14T08:00:00-1000",
      "custom_field_instances": [
        {
          "pk": 4553,
          "custom_field": {
            "is_required": false,
            "description": "",
            "booking_notes_safe_html": "",
            "type": "extended-option",
            "is_taxable": true,
            "modifier_kind": "offset",
            "description_safe_html": "",
            "booking_notes": "",
            "offset": 0,
            "pk": 720,
            "percentage": 0,
            "modifier_type": "none",
            "extended_options": [
              {
                "name": "101 Things To Do",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 39982,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Activity Desk",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 39983,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Hilton Waikoloa Briefing",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 39984,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Macaroni Grill Pleasant Briefing",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 39985,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Raintree Kona Reef Briefing",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 39986,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Royal Kona Resort Pleasant Briefing",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 39987,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Big Island Visitor Magazine",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 39988,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Big Island Revealed",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 39989,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Kings\' Shops & Waikoloa Beach Marriott VIP Card",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 39990,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Kona Bali Kai",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 39991,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "KBI Stroll",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 39992,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Internet search",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 7178,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Yelp",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 7179,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "TripAdvisor",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 7180,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Google+",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 7181,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Facebook",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 7182,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Instagram",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 7183,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Twitter",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 7184,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Friend",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 7185,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Word of mouth",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 7186,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Other",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 7187,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "Brochure",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 39993,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              }
            ],
            "is_always_per_customer": false,
            "name": "How did you hear about Body Glove?"
          }
        },
        {
          "pk": 4557,
          "custom_field": {
            "is_required": false,
            "description": "",
            "booking_notes_safe_html": "",
            "type": "extended-option",
            "is_taxable": true,
            "modifier_kind": "offset",
            "description_safe_html": "",
            "booking_notes": "",
            "offset": 0,
            "pk": 4480,
            "percentage": 0,
            "modifier_type": "none",
            "extended_options": [
              {
                "name": "Yes!",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 40044,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              },
              {
                "name": "No Thank You",
                "is_taxable": true,
                "modifier_kind": "offset",
                "description_safe_html": "",
                "offset": 0,
                "pk": 40045,
                "percentage": 0,
                "modifier_type": "none",
                "is_always_per_customer": false,
                "description": ""
              }
            ],
            "is_always_per_customer": false,
            "name": "Are you interested in SCUBA? ($105/Discover SCUBA) ($95/Certified Diver)"
          }
        }
      ],
      "item": {
        "pk": 183,
        "name": "Snorkel & Dolphin Adventure"
      },
      "pk": 70042,
      "customer_type_rates": [
        {
          "customer_prototype": {
            "pk": 287,
            "display_name": "Adults (18 and up)"
          },
          "capacity": 116,
          "custom_field_instances": [],
          "customer_type": {
            "note": "18 and up",
            "pk": 298,
            "plural": "Adults",
            "singular": "Adult"
          },
          "pk": 149124,
          "total": 13200
        },
        {
          "customer_prototype": {
            "pk": 3109,
            "display_name": "Adult Coupons"
          },
          "capacity": 116,
          "custom_field_instances": [],
          "customer_type": {
            "note": "",
            "pk": 297,
            "plural": "Adult Coupons",
            "singular": "Adult Coupon"
          },
          "pk": 1161718,
          "total": 12200
        },
        {
          "customer_prototype": {
            "pk": 288,
            "display_name": "Children (Ages 6- 17) Must be accompanied by 18+ Adult"
          },
          "capacity": 116,
          "custom_field_instances": [],
          "customer_type": {
            "note": "(Ages 6- 17) Must be accompanied by 18+ Adult",
            "pk": 299,
            "plural": "Children",
            "singular": "Child"
          },
          "pk": 149125,
          "total": 8800
        },
        {
          "customer_prototype": {
            "pk": 289,
            "display_name": "Infants (5 and younger)"
          },
          "capacity": 116,
          "custom_field_instances": [],
          "customer_type": {
            "note": "5 and younger",
            "pk": 321,
            "plural": "Infants",
            "singular": "Infant"
          },
          "pk": 1161855,
          "total": 0
        },
        {
          "customer_prototype": {
            "pk": 3110,
            "display_name": "Ride along"
          },
          "capacity": 116,
          "custom_field_instances": [],
          "customer_type": {
            "note": "",
            "pk": 300,
            "plural": "Ride Alongs",
            "singular": "Ride Along"
          },
          "pk": 1161972,
          "total": 8800
        }
      ],
      "end_at": "2016-11-14T12:30:00-1000"
    },
    "voucher_number": "VN-123456"
  }
}', :headers => {})
  end
end
