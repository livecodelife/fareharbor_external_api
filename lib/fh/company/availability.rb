module FH
  class Company::Availability
    attr_reader :capacity,
                :customer_type_rates,
                :custom_field_instances,
                :item,
                :pk,
                :start_at,
                :end_at

    def initialize(availability)
      @capacity               = availability[:capacity]
      @customer_type_rates    = availability[:customer_type_rates]
      @custom_field_instances = availability[:custom_field_instances]
      @item                   = availability[:item]
      @pk                     = availability[:pk]
      @start_at               = availability[:start_at]
      @end_at                 = availability[:end_at]
    end
  end
end
