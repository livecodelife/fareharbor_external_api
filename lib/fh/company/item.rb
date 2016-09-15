module FH
  class Company::Item
    attr_reader :image_url,
                :name,
                :cancellation_policy_safe_html,
                :headline,
                :cancellation_policy,
                :is_pickup_ever_available,
                :description_safe_html,
                :location,
                :customer_prototypes,
                :images,
                :pk,
                :tax_percentage,
                :description

    def initialize(item)
      @image_cdn_url                     = item[:image_cdn_url]
      @name                          = item[:name]
      @cancellation_policy_safe_html = item[:cancellation_policy_safe_html]
      @headline                      = item[:headline]
      @cancellation_policy           = item[:cancellation_policy]
      @is_pickup_ever_available      = item[:is_pickup_ever_available]
      @description_safe_html         = item[:description_safe_html]
      @location                      = item[:location]
      @customer_prototypes           = item[:customer_prototypes]
      @images                        = item[:images]
      @pk                            = item[:pk]
      @tax_percentage                = item[:tax_percentage]
      @description                   = item[:description]
    end
  end
end
