require 'spec_helper'

describe FH::Company::Booking.new(booking: "") do
  it 'exists' do
    expect FH::Company::Booking
  end
  it {should respond_to(:display_id)}
  it {should respond_to(:status)}
  it {should respond_to(:customers)}
  it {should respond_to(:uuid)}
  it {should respond_to(:receipt_taxes)}
  it {should respond_to(:note_safe_html)}
  it {should respond_to(:receipt_subtotal)}
  it {should respond_to(:arrival)}
  it {should respond_to(:rebooked_to)}
  it {should respond_to(:confirmation_url)}
  it {should respond_to(:note)}
  it {should respond_to(:receipt_total)}
  it {should respond_to(:pickup)}
  it {should respond_to(:contact)}
  it {should respond_to(:invoice_price)}
  it {should respond_to(:custom_field_values)}
  it {should respond_to(:pk)}
  it {should respond_to(:rebooked_from)}
  it {should respond_to(:external_id)}
  it {should respond_to(:availability)}
  it {should respond_to(:voucher_number)}
end
