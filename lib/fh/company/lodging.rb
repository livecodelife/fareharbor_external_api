module FH
  class Company::Lodging
    attr_reader :name,
                :is_self_lodging,
                :url,
                :phone,
                :address,
                :pk

    def initialize(lodging)
      @name            = lodging[:name]
      @is_self_lodging = lodging[:is_self_lodging]
      @url             = lodging[:url]
      @phone           = lodging[:phone]
      @address         = lodging[:address]
      @pk              = lodging[:pk]
    end
  end
end
