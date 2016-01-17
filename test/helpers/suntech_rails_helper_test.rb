require "test_helper"

class SuntechRailsHelperTest < ActionView::TestCase
  include SuntechRails::SuntechRailsHelper
  describe "buysafe builder" do
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
      @buysafe_payment = SuntechRails::Payment::BuySafe.new(BuySafePaymentAttributes)
    end 
    it "build form" do 
      assert_equal "<form class=\"BuySafe-form\" action=\"https://test.esafe.com.tw/Service/Etopm.aspx\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"web\" id=\"web\" value=\"S1512089010\" /><input type=\"hidden\" name=\"MN\" id=\"MN\" value=\"100\" /><input type=\"hidden\" name=\"OrderInfo\" id=\"OrderInfo\" value=\"order information limit is 400\" /><input type=\"hidden\" name=\"Td\" id=\"Td\" value=\"1\" /><input type=\"hidden\" name=\"sna\" id=\"sna\" value=\"aloha\" /><input type=\"hidden\" name=\"sdt\" id=\"sdt\" value=\"0912345678\" /><input type=\"hidden\" name=\"email\" id=\"email\" value=\"y.alohac@gmail.com\" /><input type=\"hidden\" name=\"note1\" id=\"note1\" value=\"none\" /><input type=\"hidden\" name=\"note2\" id=\"note2\" value=\"none\" /><input type=\"hidden\" name=\"Card_Type\" id=\"Card_Type\" value=\"0\" /><input type=\"hidden\" name=\"Country_Type\" id=\"Country_Type\" value=\"EN\" /><input type=\"hidden\" name=\"ChkValue\" id=\"ChkValue\" value=\"3F048A7E7AAD1A1B8A5D6D2BFD8B887B9B0BD2A0\" /><input type=\"submit\" name=\"commit\" value=\"送出\" class=\"btn payment-submit-btn\" /></form>", build_post_form(@buysafe_payment)
    end
    
  end

end
