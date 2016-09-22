require 'spec_helper'

describe FH::Company::Booking do
  it 'exists' do
    expect FH::Company::Booking
  end
  it "responds to methods" do
    booking = FH::Company::Booking.new({
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
      "rebooked_to": nil,
      "confirmation_url": "https://demo.fareharbor.com/embeds/book/bodyglove/items/183/booking/6de87e32-522e-468d-bb22-5e28d24d340b/",
      "note": "Optional booking note",
      "pickup": nil,
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
      "rebooked_from": nil,
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
    })
    expect(booking.display_id).to eq "#17081"
    expect(booking.status).to eq "booked"
    expect(booking.customers.first[:pk]).to eq 58795
    expect(booking.uuid).to eq "6de87e32-522e-468d-bb22-5e28d24d340b"
    expect(booking.receipt_taxes).to eq 1987
    expect(booking.note_safe_html).to eq "<p>Optional booking note</p>"
    expect(booking.receipt_subtotal).to eq 26400
    expect(booking.arrival[:display_text]).to eq "Please arrive by 7:45am"
    expect(booking.rebooked_to).to eq nil
    expect(booking.confirmation_url).to eq "https://demo.fareharbor.com/embeds/book/bodyglove/items/183/booking/6de87e32-522e-468d-bb22-5e28d24d340b/"
    expect(booking.note).to eq "Optional booking note"
    expect(booking.pickup).to eq nil
    expect(booking.contact[:name]).to eq 'John Doe'
    expect(booking.invoice_price).to eq 28387
    expect(booking.pk).to eq 17081
    expect(booking.rebooked_from).to eq nil
    expect(booking.external_id).to eq ""
    expect(booking.availability.class).to eq FH::Company::Availability
    expect(booking.voucher_number).to eq "VN-123456"
  end
end
