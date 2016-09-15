module FH
  class Company::Booking
    def initialize(booking)
      @display_id          = booking[:display_id]
      @status              = booking[:status]
      @customers           = booking[:customers]
      @uuid                = booking[:uuid]
      @receipt_taxes       = booking[:receipt_taxes]
      @note_safe_html      = booking[:note_safe_html]
      @receipt_subtotal    = booking[:receipt_subtotal]
      @arrival             = booking[:arrival]
      @rebooked_to         = booking[:rebooked_to]
      @confirmation_url    = booking[:confirmation_url]
      @note                = booking[:note]
      @receipt_total       = booking[:receipt_total]
      @pickup              = booking[:pickup]
      @contact             = booking[:contact]
      @invoice_price       = booking[:invoice_price]
      @custom_field_values = booking[:custom_field_values]
      @pk                  = booking[:pk]
      @rebooked_from       = booking[:rebooked_from]
      @external_id         = booking[:external_id]
      @availability        = booking[:availability]
      @voucher_number      = booking[:voucher_number]
    end
  end
end
