require 'test_helper'
require 'suntech_rails_payment'

describe SuntechRails::Payment::BuySafe do
  describe "basic operation" do 
    before do 
      BuySafePaymentAttributes = {
        "MN" =>  "100",
        "OrderInfo" =>  "order information limit is 400",
        "Td" => "1",
        "sna" => "aloha",
        "sdt" => "0912345678",
        "email" => 'y.alohac@gmail.com',
        "note1" => 'none',
        "note2" => "none",
        "Card_Type" => '0',
        "Country_Type" => 'EN'
      }
    end
    it "can new a instanace" do 
      buysafe_payment = SuntechRails::Payment::BuySafe.new(BuySafePaymentAttributes)
      buysafe_payment.email.must_equal BuySafePaymentAttributes["email"]
    end
  end
end