module FH
  class Companies

    def self.service
      FareHarborService.new
    end

    def self.all
      service.get_companies
    end

    def self.find(shortname)
      all.find { |company| company.shortname == shortname }
    end
  end
end
