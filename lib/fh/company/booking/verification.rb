module FH
  class Company::Booking::Verification
    attr_reader :invoice_price,
                :receipt_taxes,
                :receipt_subtotal,
                :pickup,
                :receipt_total,
                :is_bookable

    def initialize(verification)
      @invoice_price    = verification[:invoice_price]
      @receipt_taxes    = verification[:receipt_taxes]
      @receipt_subtotal = verification[:receipt_subtotal]
      @pickup           = verification[:pickup]
      @receipt_total    = verification[:receipt_total]
      @is_bookable      = verification[:is_bookable]
    end
  end
end
