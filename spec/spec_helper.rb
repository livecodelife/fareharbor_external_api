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
                                },
                                {
                                  "image_cdn_url": "https://d1a2dkr8rai8e2.cloudfront.net/api/file/nLpbOZqrQPOnAyroPGaB",
                                  "name": "2 Hr Sailboat Tour",
                                  "cancellation_policy_safe_html": "",
                                  "headline": "",
                                  "cancellation_policy": "",
                                  "is_pickup_ever_available": false,
                                  "description_safe_html": "",
                                  "location": "San Francisco Bay",
                                  "customer_prototypes": [
                                    {
                                      "pk": 2279,
                                      "display_name": "Adult"
                                    },
                                    {
                                      "pk": 2675,
                                      "display_name": "Child"
                                    }
                                  ],
                                  "images": [],
                                  "pk": 1025,
                                  "tax_percentage": 7.7122,
                                  "description": ""
                                },
                                {
                                  "image_cdn_url": "https://d1a2dkr8rai8e2.cloudfront.net/api/file/92dNzb8mRUCzD1JbhVT6",
                                  "name": "Evening Tour",
                                  "cancellation_policy_safe_html": "<p>Customers will receive a full refund with <strong>12 hours notice of cancellation</strong>. Customers will also receive a full refund in case of operator cancellation due to weather or other unforeseen circumstances. Contact us by phone to cancel or inquire about a cancellation. <strong>No-shows will be charged the full price</strong>.</p>",
                                  "headline": "",
                                  "cancellation_policy": "Customers will receive a full refund with **12 hours notice of cancellation**. Customers will also receive a full refund in case of operator cancellation due to weather or other unforeseen circumstances. Contact us by phone to cancel or inquire about a cancellation. **No-shows will be charged the full price**.",
                                  "is_pickup_ever_available": false,
                                  "description_safe_html": "",
                                  "location": "",
                                  "customer_prototypes": [
                                    {
                                      "pk": 2389,
                                      "display_name": "Adult"
                                    },
                                    {
                                      "pk": 2390,
                                      "display_name": "Child"
                                    },
                                    {
                                      "pk": 2839,
                                      "display_name": "GC"
                                    }
                                  ],
                                  "images": [],
                                  "pk": 1069,
                                  "tax_percentage": 7.7122,
                                  "description": ""
                                },
                                {
                                  "image_cdn_url": "https://d1a2dkr8rai8e2.cloudfront.net/api/file/DIAKeTyBSkScVHD4SQFV",
                                  "name": "Sunset Charter",
                                  "cancellation_policy_safe_html": "",
                                  "headline": "",
                                  "cancellation_policy": "",
                                  "is_pickup_ever_available": true,
                                  "description_safe_html": "<p>Public or private</p>",
                                  "location": "Windward Coast",
                                  "customer_prototypes": [
                                    {
                                      "pk": 2669,
                                      "display_name": "Adult"
                                    },
                                    {
                                      "pk": 2670,
                                      "display_name": "Child"
                                    }
                                  ],
                                  "images": [],
                                  "pk": 1123,
                                  "tax_percentage": 7.7122,
                                  "description": "Public or private"
                                },
                                {
                                  "image_cdn_url": "https://d1a2dkr8rai8e2.cloudfront.net/api/file/vl8rUKU1SYqWtIlPhp15",
                                  "name": "West Island Tour",
                                  "cancellation_policy_safe_html": "",
                                  "headline": "",
                                  "cancellation_policy": "",
                                  "is_pickup_ever_available": false,
                                  "description_safe_html": "<p>West island</p>",
                                  "location": "West Island",
                                  "customer_prototypes": [
                                    {
                                      "pk": 2558,
                                      "display_name": "Adult"
                                    }
                                  ],
                                  "images": [],
                                  "pk": 1117,
                                  "tax_percentage": 7.7122,
                                  "description": "West island"
                                },
                                {
                                  "image_cdn_url": "https://d1a2dkr8rai8e2.cloudfront.net/api/file/IL3FpqfVSrCaLw3cFNQA",
                                  "name": "Snorkel Tour",
                                  "cancellation_policy_safe_html": "",
                                  "headline": "",
                                  "cancellation_policy": "",
                                  "is_pickup_ever_available": false,
                                  "description_safe_html": "",
                                  "location": "",
                                  "customer_prototypes": [
                                    {
                                      "pk": 2681,
                                      "display_name": "Adult"
                                    },
                                    {
                                      "pk": 2685,
                                      "display_name": "Adult"
                                    },
                                    {
                                      "pk": 2682,
                                      "display_name": "Child"
                                    },
                                    {
                                      "pk": 2628,
                                      "display_name": "Private charter"
                                    }
                                  ],
                                  "images": [],
                                  "pk": 1124,
                                  "tax_percentage": 7.7122,
                                  "description": ""
                                },
                                {
                                  "image_cdn_url": "https://d1a2dkr8rai8e2.cloudfront.net/api/file/CibF3WWWQ0GbPm9SKc6f",
                                  "name": "Scuba Tour",
                                  "cancellation_policy_safe_html": "",
                                  "headline": "",
                                  "cancellation_policy": "",
                                  "is_pickup_ever_available": false,
                                  "description_safe_html": "",
                                  "location": "",
                                  "customer_prototypes": [
                                    {
                                      "pk": 2575,
                                      "display_name": "Person"
                                    },
                                    {
                                      "pk": 2698,
                                      "display_name": "Adult - Afternoon"
                                    },
                                    {
                                      "pk": 2692,
                                      "display_name": "Adult - Morning"
                                    },
                                    {
                                      "pk": 2664,
                                      "display_name": "Private charter"
                                    }
                                  ],
                                  "images": [],
                                  "pk": 1125,
                                  "tax_percentage": 7.7122,
                                  "description": ""
                                },
                                {
                                  "image_cdn_url": "https://cdn.filestackcontent.com/cfKSSbeHRgOOHEpZ0TaP",
                                  "name": "Gift Card",
                                  "cancellation_policy_safe_html": "",
                                  "headline": "",
                                  "cancellation_policy": "",
                                  "is_pickup_ever_available": false,
                                  "description_safe_html": "",
                                  "location": "",
                                  "customer_prototypes": [
                                    {
                                      "pk": 2838,
                                      "display_name": "GC"
                                    }
                                  ],
                                  "images": [],
                                  "pk": 1240,
                                  "tax_percentage": 7.7122,
                                  "description": ""
                                },
                                {
                                  "image_cdn_url": "",
                                  "name": "Headline only added to the first bookable availability",
                                  "cancellation_policy_safe_html": "",
                                  "headline": "",
                                  "cancellation_policy": "",
                                  "is_pickup_ever_available": false,
                                  "description_safe_html": "",
                                  "location": "",
                                  "customer_prototypes": [
                                    {
                                      "pk": 3173,
                                      "display_name": "Person"
                                    }
                                  ],
                                  "images": [],
                                  "pk": 1375,
                                  "tax_percentage": 7.7122,
                                  "description": ""
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
    },
    {
      "start_at": "2016-11-14T09:00:00-1000",
      "pk": 390637,
      "capacity": 18,
      "customer_type_rates": [
        {
          "pk": 931034,
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
          "pk": 931035,
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
          "pk": 931036,
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
          "pk": 931037,
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
          "pk": 931038,
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
          "pk": 931039,
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
      "end_at": "2016-11-14T10:30:00-1000"
    },
    {
      "start_at": "2016-11-14T11:00:00-1000",
      "pk": 434896,
      "capacity": 18,
      "customer_type_rates": [
        {
          "pk": 1041080,
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
          "pk": 1041081,
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
          "pk": 1041082,
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
          "pk": 1041083,
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
          "pk": 1041084,
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
          "pk": 1041085,
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
      "end_at": "2016-11-14T12:30:00-1000"
    },
    {
      "start_at": "2016-11-14T13:00:00-1000",
      "pk": 391214,
      "capacity": 18,
      "customer_type_rates": [
        {
          "pk": 934496,
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
          "pk": 934497,
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
          "pk": 934498,
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
          "pk": 934499,
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
          "pk": 934500,
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
          "pk": 934501,
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
      "end_at": "2016-11-14T14:30:00-1000"
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
    },
    {
      "start_at": "2016-11-14T09:00:00-1000",
      "pk": 390637,
      "capacity": 18,
      "customer_type_rates": [
        {
          "pk": 931034,
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
          "pk": 931035,
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
          "pk": 931036,
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
          "pk": 931037,
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
          "pk": 931038,
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
          "pk": 931039,
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
      "end_at": "2016-11-14T10:30:00-1000"
    },
    {
      "start_at": "2016-11-14T11:00:00-1000",
      "pk": 434896,
      "capacity": 18,
      "customer_type_rates": [
        {
          "pk": 1041080,
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
          "pk": 1041081,
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
          "pk": 1041082,
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
          "pk": 1041083,
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
          "pk": 1041084,
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
          "pk": 1041085,
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
      "end_at": "2016-11-14T12:30:00-1000"
    },
    {
      "start_at": "2016-11-14T13:00:00-1000",
      "pk": 391214,
      "capacity": 18,
      "customer_type_rates": [
        {
          "pk": 934496,
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
          "pk": 934497,
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
          "pk": 934498,
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
          "pk": 934499,
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
          "pk": 934500,
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
          "pk": 934501,
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
      "end_at": "2016-11-14T14:30:00-1000"
    },
    {
      "start_at": "2016-11-15T07:00:00-1000",
      "pk": 435427,
      "capacity": 18,
      "customer_type_rates": [
        {
          "pk": 1044266,
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
          "pk": 1044267,
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
          "pk": 1044268,
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
          "pk": 1044269,
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
          "pk": 1044270,
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
          "pk": 1044271,
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
      "end_at": "2016-11-15T08:30:00-1000"
    },
    {
      "start_at": "2016-11-15T09:00:00-1000",
      "pk": 390638,
      "capacity": 18,
      "customer_type_rates": [
        {
          "pk": 931040,
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
          "pk": 931041,
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
          "pk": 931042,
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
          "pk": 931043,
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
          "pk": 931044,
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
          "pk": 931045,
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
      "end_at": "2016-11-15T10:30:00-1000"
    },
    {
      "start_at": "2016-11-15T11:00:00-1000",
      "pk": 434897,
      "capacity": 18,
      "customer_type_rates": [
        {
          "pk": 1041086,
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
          "pk": 1041087,
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
          "pk": 1041088,
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
          "pk": 1041089,
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
          "pk": 1041090,
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
          "pk": 1041091,
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
      "end_at": "2016-11-15T12:30:00-1000"
    },
    {
      "start_at": "2016-11-15T13:00:00-1000",
      "pk": 391215,
      "capacity": 18,
      "customer_type_rates": [
        {
          "pk": 934502,
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
          "pk": 934503,
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
          "pk": 934504,
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
          "pk": 934505,
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
          "pk": 934506,
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
          "pk": 934507,
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
      "end_at": "2016-11-15T14:30:00-1000"
    },
    {
      "start_at": "2016-11-16T07:00:00-1000",
      "pk": 435428,
      "capacity": 18,
      "customer_type_rates": [
        {
          "pk": 1044272,
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
          "pk": 1044273,
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
          "pk": 1044274,
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
          "pk": 1044275,
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
          "pk": 1044276,
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
          "pk": 1044277,
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
      "end_at": "2016-11-16T08:30:00-1000"
    },
    {
      "start_at": "2016-11-16T09:00:00-1000",
      "pk": 390639,
      "capacity": 18,
      "customer_type_rates": [
        {
          "pk": 931046,
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
          "pk": 931047,
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
          "pk": 931048,
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
          "pk": 931049,
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
          "pk": 931050,
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
          "pk": 931051,
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
      "end_at": "2016-11-16T10:30:00-1000"
    },
    {
      "start_at": "2016-11-16T11:00:00-1000",
      "pk": 434898,
      "capacity": 18,
      "customer_type_rates": [
        {
          "pk": 1041092,
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
          "pk": 1041093,
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
          "pk": 1041094,
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
          "pk": 1041095,
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
          "pk": 1041096,
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
          "pk": 1041097,
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
      "end_at": "2016-11-16T12:30:00-1000"
    },
    {
      "start_at": "2016-11-16T13:00:00-1000",
      "pk": 391216,
      "capacity": 18,
      "customer_type_rates": [
        {
          "pk": 934508,
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
          "pk": 934509,
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
          "pk": 934510,
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
          "pk": 934511,
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
          "pk": 934512,
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
          "pk": 934513,
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
      "end_at": "2016-11-16T14:30:00-1000"
    },
    {
      "start_at": "2016-11-17T07:00:00-1000",
      "pk": 435429,
      "capacity": 18,
      "customer_type_rates": [
        {
          "pk": 1044278,
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
          "pk": 1044279,
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
          "pk": 1044280,
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
          "pk": 1044281,
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
          "pk": 1044282,
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
          "pk": 1044283,
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
      "end_at": "2016-11-17T08:30:00-1000"
    },
    {
      "start_at": "2016-11-17T09:00:00-1000",
      "pk": 390640,
      "capacity": 18,
      "customer_type_rates": [
        {
          "pk": 931052,
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
          "pk": 931053,
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
          "pk": 931054,
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
          "pk": 931055,
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
          "pk": 931056,
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
          "pk": 931057,
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
      "end_at": "2016-11-17T10:30:00-1000"
    },
    {
      "start_at": "2016-11-17T11:00:00-1000",
      "pk": 434899,
      "capacity": 18,
      "customer_type_rates": [
        {
          "pk": 1041098,
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
          "pk": 1041099,
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
          "pk": 1041100,
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
          "pk": 1041101,
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
          "pk": 1041102,
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
          "pk": 1041103,
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
      "end_at": "2016-11-17T12:30:00-1000"
    },
    {
      "start_at": "2016-11-17T13:00:00-1000",
      "pk": 391217,
      "capacity": 18,
      "customer_type_rates": [
        {
          "pk": 934514,
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
          "pk": 934515,
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
          "pk": 934516,
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
          "pk": 934517,
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
          "pk": 934518,
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
          "pk": 934519,
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
      "end_at": "2016-11-17T14:30:00-1000"
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
    },
    {
      "name": "Alii Lani",
      "is_self_lodging": false,
      "url": "",
      "phone": "",
      "address": "",
      "pk": 556
    },
    {
      "name": "Alii Villa Condominium",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 329-1288",
      "address": "",
      "pk": 557
    },
    {
      "name": "Aston Shores at Waikoloa",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 886-5001",
      "address": "",
      "pk": 558
    },
    {
      "name": "Aston Waikoloa Colony Villas",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 886-8899",
      "address": "",
      "pk": 559
    },
    {
      "name": "Banyan Tree Condominiums",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 329-3006",
      "address": "",
      "pk": 560
    },
    {
      "name": "Bay Club at Waikoloa Beach Resort",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 886-7979",
      "address": "",
      "pk": 561
    },
    {
      "name": "Bed & Breakfast",
      "is_self_lodging": false,
      "url": "",
      "phone": "",
      "address": "",
      "pk": 562
    },
    {
      "name": "Camping",
      "is_self_lodging": false,
      "url": "",
      "phone": "",
      "address": "",
      "pk": 563
    },
    {
      "name": "Casa-De-Emdeko",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 329-2160",
      "address": "",
      "pk": 564
    },
    {
      "name": "Chalet Kilauea - The Chalet Kilauea Collection",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 967-7786",
      "address": "",
      "pk": 565
    },
    {
      "name": "Club At Waikoloa Beach Resort by Hilton Grand Vacations",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 886-8700",
      "address": "",
      "pk": 566
    },
    {
      "name": "Courtyard King Kamehameha\'s Kona Beach Hotel",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 329-2911",
      "address": "",
      "pk": 567
    },
    {
      "name": "Cruise Ship",
      "is_self_lodging": false,
      "url": "",
      "phone": "",
      "address": "",
      "pk": 568
    },
    {
      "name": "Day Only",
      "is_self_lodging": false,
      "url": "",
      "phone": "",
      "address": "",
      "pk": 569
    },
    {
      "name": "Dragonfly Ranch",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 328-2159",
      "address": "",
      "pk": 570
    },
    {
      "name": "Four Seasons",
      "is_self_lodging": false,
      "url": "",
      "phone": "",
      "address": "",
      "pk": 571
    },
    {
      "name": "Hale Kona Kai Condominium",
      "is_self_lodging": false,
      "url": "",
      "phone": "(800) 421-3696",
      "address": "",
      "pk": 572
    },
    {
      "name": "Halii Kai At Waikoloa",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 886-4307",
      "address": "",
      "pk": 573
    },
    {
      "name": "Hapuna Beach Prince Hotel",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 880-1111",
      "address": "",
      "pk": 574
    },
    {
      "name": "Hilo Hawaiian Hotel",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 935-9361",
      "address": "",
      "pk": 575
    },
    {
      "name": "Hilo Seaside Hotel",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 935-0821",
      "address": "",
      "pk": 576
    },
    {
      "name": "Hilton Waikoloa Village",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 886-1234",
      "address": "",
      "pk": 577
    },
    {
      "name": "Holiday Inn Express",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 329-2599",
      "address": "",
      "pk": 578
    },
    {
      "name": "Holualoa Inn",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 324-1121",
      "address": "",
      "pk": 580
    },
    {
      "name": "Holua Resort at the Mauna Loa Village",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 324-1550",
      "address": "",
      "pk": 579
    },
    {
      "name": "Hualalai Resort",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 325-8400",
      "address": "",
      "pk": 581
    },
    {
      "name": "Kahaluu Bay Villas",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 322-0013",
      "address": "",
      "pk": 582
    },
    {
      "name": "Kailua Pier",
      "is_self_lodging": false,
      "url": "",
      "phone": "",
      "address": "",
      "pk": 583
    },
    {
      "name": "Kanaloa at Kona by Outrigger",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 322-9625",
      "address": "",
      "pk": 584
    },
    {
      "name": "Keauhou-Kona Surf/Racquet",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 322-9131",
      "address": "",
      "pk": 586
    },
    {
      "name": "Keauhou Resort Condominiums",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 322-9122",
      "address": "",
      "pk": 585
    },
    {
      "name": "Kilauea Lodge",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 967-7366",
      "address": "",
      "pk": 587
    },
    {
      "name": "Kilauea Military Camp",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 967-8333",
      "address": "",
      "pk": 588
    },
    {
      "name": "Kings\' Land by Hilton Grand Vacations Club",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 881-3000",
      "address": "",
      "pk": 589
    },
    {
      "name": "Kohala Suites",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 886-8700",
      "address": "",
      "pk": 590
    },
    {
      "name": "Kohala Village Inn",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 889-0404",
      "address": "",
      "pk": 591
    },
    {
      "name": "Kolea at Waikoloa Beach Resort",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 987-4519",
      "address": "",
      "pk": 592
    },
    {
      "name": "Kona Bali Kai By Castle Lodging",
      "is_self_lodging": false,
      "url": "",
      "phone": "",
      "address": "",
      "pk": 593
    },
    {
      "name": "Kona Billfisher Resort",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 329-9277",
      "address": "",
      "pk": 594
    },
    {
      "name": "Kona by the Sea By Aston",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 327-2300",
      "address": "",
      "pk": 595
    },
    {
      "name": "Kona Coast Resort",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 324-1721",
      "address": "",
      "pk": 596
    },
    {
      "name": "Kona Hawaiian Resort by Wyndham",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 334-4700",
      "address": "",
      "pk": 597
    },
    {
      "name": "Kona Islander Inn Hotel",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 329-3333",
      "address": "",
      "pk": 598
    },
    {
      "name": "Kona Isle Condominums",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 329-2241",
      "address": "",
      "pk": 599
    },
    {
      "name": "Kona Magic Sands",
      "is_self_lodging": false,
      "url": "",
      "phone": "(800) 244-4752",
      "address": "",
      "pk": 600
    },
    {
      "name": "Kona Makai Condominiums",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 329-1511",
      "address": "",
      "pk": 601
    },
    {
      "name": "Kona Mansions Vacation Rentals",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 329-2374",
      "address": "",
      "pk": 602
    },
    {
      "name": "Kona Pacific Condominium",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 329-6140",
      "address": "",
      "pk": 603
    },
    {
      "name": "Kona Pacific Vacation Rentals",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 329-6140",
      "address": "",
      "pk": 604
    },
    {
      "name": "Kona Reef",
      "is_self_lodging": false,
      "url": "",
      "phone": "",
      "address": "",
      "pk": 605
    },
    {
      "name": "Kona Riviera Villa",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 329-1996",
      "address": "",
      "pk": 606
    },
    {
      "name": "Kona Seaside Hotel",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 329-2455",
      "address": "",
      "pk": 608
    },
    {
      "name": "Kona Sea Village Hotel",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 326-2252",
      "address": "",
      "pk": 607
    },
    {
      "name": "Kona Shores House of Turtle Condo Rental",
      "is_self_lodging": false,
      "url": "",
      "phone": "(831) 338-2983",
      "address": "",
      "pk": 609
    },
    {
      "name": "Kona Tiki Hotel",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 329-1425",
      "address": "",
      "pk": 610
    },
    {
      "name": "Kona Westwind Condos",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 329-6222",
      "address": "",
      "pk": 611
    },
    {
      "name": "Kuakini Terrace",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 322-3441",
      "address": "",
      "pk": 612
    },
    {
      "name": "Local Residence",
      "is_self_lodging": false,
      "url": "",
      "phone": "",
      "address": "",
      "pk": 613
    },
    {
      "name": "Mauna Kea Beach Hotel",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 882-7222",
      "address": "",
      "pk": 614
    },
    {
      "name": "Mauna Kea Fairways",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 882-7222",
      "address": "",
      "pk": 615
    },
    {
      "name": "Mauna Lani Bay Hotel & Bungalows",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 885-6622",
      "address": "",
      "pk": 616
    },
    {
      "name": "Mauna Loa Village by Wyndham",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 969-3333",
      "address": "",
      "pk": 617
    },
    {
      "name": "Outrigger Fairway Villas",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 886-0036",
      "address": "",
      "pk": 618
    },
    {
      "name": "Outrigger Reef on the Beach",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 923-3111",
      "address": "",
      "pk": 619
    },
    {
      "name": "Paniolo Greens Resort",
      "is_self_lodging": false,
      "url": "",
      "phone": "(888) 450-4646",
      "address": "",
      "pk": 620
    },
    {
      "name": "Private Residence (Private Residence)",
      "is_self_lodging": false,
      "url": "",
      "phone": "",
      "address": "",
      "pk": 621
    },
    {
      "name": "Royal Kahili Condominiums",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 333-4270",
      "address": "",
      "pk": 622
    },
    {
      "name": "Royal Kona Resort",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 329-3111",
      "address": "",
      "pk": 623
    },
    {
      "name": "Royal Sea Cliff by Outrigger",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 329-8021",
      "address": "",
      "pk": 624
    },
    {
      "name": "Sheraton Kona Resort & Spa - Keauhou Bay",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 930-4900",
      "address": "",
      "pk": 625
    },
    {
      "name": "The Fairmont Orchid, Hawaii",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 885-2000",
      "address": "",
      "pk": 626
    },
    {
      "name": "The Kamuela Inn",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 886-0036",
      "address": "",
      "pk": 627
    },
    {
      "name": "The Sea Village",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 326-2252",
      "address": "",
      "pk": 628
    },
    {
      "name": "Uncle Billy\'s - Hilo Bay Hotel",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 935-0861",
      "address": "",
      "pk": 629
    },
    {
      "name": "Uncle Billy\'s Kona Bay Hotel",
      "is_self_lodging": false,
      "url": "",
      "phone": "",
      "address": "",
      "pk": 630
    },
    {
      "name": "Unknown",
      "is_self_lodging": false,
      "url": "",
      "phone": "",
      "address": "",
      "pk": 631
    },
    {
      "name": "Vacation International Sea Mountain",
      "is_self_lodging": false,
      "url": "",
      "phone": "",
      "address": "",
      "pk": 632
    },
    {
      "name": "Volcano Village Lodge",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 985-9500",
      "address": "",
      "pk": 633
    },
    {
      "name": "Waikoloa Beach Marriott Resort & Spa",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 886-6789",
      "address": "",
      "pk": 634
    },
    {
      "name": "Waikoloa Beach Resort",
      "is_self_lodging": false,
      "url": "",
      "phone": "(877) 924-5656",
      "address": "",
      "pk": 635
    },
    {
      "name": "White Sands Hotel",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 954-7429",
      "address": "",
      "pk": 636
    },
    {
      "name": "WorldMark by Wyndham",
      "is_self_lodging": false,
      "url": "",
      "phone": "(808) 322-9131",
      "address": "",
      "pk": 637
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
      "pk": 555,
      "is_pickup_available": false,
      "name": "Alii Cove"
    },
    {
      "pk": 556,
      "is_pickup_available": false,
      "name": "Alii Lani"
    },
    {
      "pk": 557,
      "is_pickup_available": false,
      "name": "Alii Villa Condominium"
    },
    {
      "pk": 558,
      "is_pickup_available": false,
      "name": "Aston Shores at Waikoloa"
    },
    {
      "pk": 559,
      "is_pickup_available": false,
      "name": "Aston Waikoloa Colony Villas"
    },
    {
      "pk": 560,
      "is_pickup_available": false,
      "name": "Banyan Tree Condominiums"
    },
    {
      "pk": 561,
      "is_pickup_available": false,
      "name": "Bay Club at Waikoloa Beach Resort"
    },
    {
      "pk": 562,
      "is_pickup_available": false,
      "name": "Bed & Breakfast"
    },
    {
      "pk": 563,
      "is_pickup_available": false,
      "name": "Camping"
    },
    {
      "pk": 564,
      "is_pickup_available": false,
      "name": "Casa-De-Emdeko"
    },
    {
      "pk": 565,
      "is_pickup_available": false,
      "name": "Chalet Kilauea - The Chalet Kilauea Collection"
    },
    {
      "pk": 566,
      "is_pickup_available": false,
      "name": "Club At Waikoloa Beach Resort by Hilton Grand Vacations"
    },
    {
      "pk": 567,
      "is_pickup_available": false,
      "name": "Courtyard King Kamehameha\'s Kona Beach Hotel"
    },
    {
      "pk": 568,
      "is_pickup_available": false,
      "name": "Cruise Ship"
    },
    {
      "pk": 569,
      "is_pickup_available": false,
      "name": "Day Only"
    },
    {
      "pk": 570,
      "is_pickup_available": false,
      "name": "Dragonfly Ranch"
    },
    {
      "pk": 571,
      "is_pickup_available": false,
      "name": "Four Seasons"
    },
    {
      "pk": 572,
      "is_pickup_available": false,
      "name": "Hale Kona Kai Condominium"
    },
    {
      "pk": 573,
      "is_pickup_available": false,
      "name": "Halii Kai At Waikoloa"
    },
    {
      "pk": 574,
      "is_pickup_available": false,
      "name": "Hapuna Beach Prince Hotel"
    },
    {
      "pk": 575,
      "is_pickup_available": false,
      "name": "Hilo Hawaiian Hotel"
    },
    {
      "pk": 576,
      "is_pickup_available": false,
      "name": "Hilo Seaside Hotel"
    },
    {
      "pk": 577,
      "is_pickup_available": false,
      "name": "Hilton Waikoloa Village"
    },
    {
      "pk": 578,
      "is_pickup_available": false,
      "name": "Holiday Inn Express"
    },
    {
      "pk": 580,
      "is_pickup_available": false,
      "name": "Holualoa Inn"
    },
    {
      "pk": 579,
      "is_pickup_available": false,
      "name": "Holua Resort at the Mauna Loa Village"
    },
    {
      "pk": 581,
      "is_pickup_available": false,
      "name": "Hualalai Resort"
    },
    {
      "pk": 582,
      "is_pickup_available": false,
      "name": "Kahaluu Bay Villas"
    },
    {
      "pk": 583,
      "is_pickup_available": false,
      "name": "Kailua Pier"
    },
    {
      "pk": 584,
      "is_pickup_available": false,
      "name": "Kanaloa at Kona by Outrigger"
    },
    {
      "pk": 586,
      "is_pickup_available": false,
      "name": "Keauhou-Kona Surf/Racquet"
    },
    {
      "pk": 585,
      "is_pickup_available": false,
      "name": "Keauhou Resort Condominiums"
    },
    {
      "pk": 587,
      "is_pickup_available": false,
      "name": "Kilauea Lodge"
    },
    {
      "pk": 588,
      "is_pickup_available": false,
      "name": "Kilauea Military Camp"
    },
    {
      "pk": 589,
      "is_pickup_available": false,
      "name": "Kings\' Land by Hilton Grand Vacations Club"
    },
    {
      "pk": 590,
      "is_pickup_available": false,
      "name": "Kohala Suites"
    },
    {
      "pk": 591,
      "is_pickup_available": false,
      "name": "Kohala Village Inn"
    },
    {
      "pk": 592,
      "is_pickup_available": false,
      "name": "Kolea at Waikoloa Beach Resort"
    },
    {
      "pk": 593,
      "is_pickup_available": false,
      "name": "Kona Bali Kai By Castle Lodging"
    },
    {
      "pk": 594,
      "is_pickup_available": false,
      "name": "Kona Billfisher Resort"
    },
    {
      "pk": 595,
      "is_pickup_available": false,
      "name": "Kona by the Sea By Aston"
    },
    {
      "pk": 596,
      "is_pickup_available": false,
      "name": "Kona Coast Resort"
    },
    {
      "pk": 597,
      "is_pickup_available": false,
      "name": "Kona Hawaiian Resort by Wyndham"
    },
    {
      "pk": 598,
      "is_pickup_available": false,
      "name": "Kona Islander Inn Hotel"
    },
    {
      "pk": 599,
      "is_pickup_available": false,
      "name": "Kona Isle Condominums"
    },
    {
      "pk": 600,
      "is_pickup_available": false,
      "name": "Kona Magic Sands"
    },
    {
      "pk": 601,
      "is_pickup_available": false,
      "name": "Kona Makai Condominiums"
    },
    {
      "pk": 602,
      "is_pickup_available": false,
      "name": "Kona Mansions Vacation Rentals"
    },
    {
      "pk": 603,
      "is_pickup_available": false,
      "name": "Kona Pacific Condominium"
    },
    {
      "pk": 604,
      "is_pickup_available": false,
      "name": "Kona Pacific Vacation Rentals"
    },
    {
      "pk": 605,
      "is_pickup_available": false,
      "name": "Kona Reef"
    },
    {
      "pk": 606,
      "is_pickup_available": false,
      "name": "Kona Riviera Villa"
    },
    {
      "pk": 608,
      "is_pickup_available": false,
      "name": "Kona Seaside Hotel"
    },
    {
      "pk": 607,
      "is_pickup_available": false,
      "name": "Kona Sea Village Hotel"
    },
    {
      "pk": 609,
      "is_pickup_available": false,
      "name": "Kona Shores House of Turtle Condo Rental"
    },
    {
      "pk": 610,
      "is_pickup_available": false,
      "name": "Kona Tiki Hotel"
    },
    {
      "pk": 611,
      "is_pickup_available": false,
      "name": "Kona Westwind Condos"
    },
    {
      "pk": 612,
      "is_pickup_available": false,
      "name": "Kuakini Terrace"
    },
    {
      "pk": 613,
      "is_pickup_available": false,
      "name": "Local Residence"
    },
    {
      "pk": 614,
      "is_pickup_available": false,
      "name": "Mauna Kea Beach Hotel"
    },
    {
      "pk": 615,
      "is_pickup_available": false,
      "name": "Mauna Kea Fairways"
    },
    {
      "pk": 616,
      "is_pickup_available": false,
      "name": "Mauna Lani Bay Hotel & Bungalows"
    },
    {
      "pk": 617,
      "is_pickup_available": false,
      "name": "Mauna Loa Village by Wyndham"
    },
    {
      "pk": 618,
      "is_pickup_available": false,
      "name": "Outrigger Fairway Villas"
    },
    {
      "pk": 619,
      "is_pickup_available": false,
      "name": "Outrigger Reef on the Beach"
    },
    {
      "pk": 620,
      "is_pickup_available": false,
      "name": "Paniolo Greens Resort"
    },
    {
      "pk": 621,
      "is_pickup_available": false,
      "name": "Private Residence (Private Residence)"
    },
    {
      "pk": 622,
      "is_pickup_available": false,
      "name": "Royal Kahili Condominiums"
    },
    {
      "pk": 623,
      "is_pickup_available": false,
      "name": "Royal Kona Resort"
    },
    {
      "pk": 624,
      "is_pickup_available": false,
      "name": "Royal Sea Cliff by Outrigger"
    },
    {
      "pk": 625,
      "is_pickup_available": false,
      "name": "Sheraton Kona Resort & Spa - Keauhou Bay"
    },
    {
      "pk": 626,
      "is_pickup_available": false,
      "name": "The Fairmont Orchid, Hawaii"
    },
    {
      "pk": 627,
      "is_pickup_available": false,
      "name": "The Kamuela Inn"
    },
    {
      "pk": 628,
      "is_pickup_available": false,
      "name": "The Sea Village"
    },
    {
      "pk": 629,
      "is_pickup_available": false,
      "name": "Uncle Billy\'s - Hilo Bay Hotel"
    },
    {
      "pk": 630,
      "is_pickup_available": false,
      "name": "Uncle Billy\'s Kona Bay Hotel"
    },
    {
      "pk": 631,
      "is_pickup_available": false,
      "name": "Unknown"
    },
    {
      "pk": 632,
      "is_pickup_available": false,
      "name": "Vacation International Sea Mountain"
    },
    {
      "pk": 633,
      "is_pickup_available": false,
      "name": "Volcano Village Lodge"
    },
    {
      "pk": 634,
      "is_pickup_available": false,
      "name": "Waikoloa Beach Marriott Resort & Spa"
    },
    {
      "pk": 635,
      "is_pickup_available": false,
      "name": "Waikoloa Beach Resort"
    },
    {
      "pk": 636,
      "is_pickup_available": false,
      "name": "White Sands Hotel"
    },
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
