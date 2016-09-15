module FH
  class Companies

    def self.service
      FareHarborService.new
    end

    def self.all
      companies_hash = service.get_companies
      companies_hash[:companies].map do |company|
        FH::Company.new(company)
      end
    end

    def self.find(shortname)
      all.find { |company| company.shortname == shortname }
    end
  end
end
