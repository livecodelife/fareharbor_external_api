require 'spec_helper'

describe FH::Company::Booking::Verification.new(verification: "") do
  it 'exists' do
    expect FH::Company::Booking::Verification
  end

  it {should respond_to(:invoice_price)}
  it {should respond_to(:receipt_taxes)}
  it {should respond_to(:receipt_subtotal)}
  it {should respond_to(:pickup)}
  it {should respond_to(:receipt_total)}
  it {should respond_to(:is_bookable)}
end
