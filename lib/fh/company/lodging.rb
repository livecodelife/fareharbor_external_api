module FH
  class Company::Lodging
    attr_reader :name,
                :is_self_lodging,
                :url,
                :phone,
                :address,
                :pk,
                :is_pickup_available

    def initialize(lodging)
      @name            = lodging[:name]
      @is_self_lodging = lodging[:is_self_lodging]
      @url             = lodging[:url]
      @phone           = lodging[:phone]
      @address         = lodging[:address]
      @pk              = lodging[:pk]
      @is_pickup_available = lodging[:is_pickup_available]
    end
  end
end
