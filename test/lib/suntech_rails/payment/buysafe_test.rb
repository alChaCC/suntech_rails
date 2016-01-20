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

  describe "callback checking" do 
    before do 
      Success = {
        "buysafeno"=>"N090001601210000024", 
        "web"=>"S1512089010", 
        "MN"=>"100", 
        "Td"=>"1453305918", 
        "webname"=>"%e7%b6%a0%e9%bb%9e%e8%83%bd%e5%89%b5%e8%82%a1%e4%bb%bd%e6%9c%89%e9%99%90%e5%85%ac%e5%8f%b8", 
        "Name"=>"1%e2%97%8b%e2%97%8b%e2%97%8b%e2%97%8b1", 
        "note1"=>"none", 
        "note2"=>"none", 
        "ApproveCode"=>"T0NCCC", 
        "Card_NO"=>"1234", 
        "UserNo"=>"", 
        "BarcodeA"=>"", 
        "BarcodeB"=>"", 
        "BarcodeC"=>"", 
        "PostBarcodeA"=>"", 
        "PostBarcodeB"=>"", 
        "PostBarcodeC"=>"", 
        "EntityATM"=>"", 
        "paycode"=>"", 
        "PayType"=>"", 
        "SendType"=>"2", 
        "errcode"=>"00", 
        "errmsg"=>"%e6%88%90%e5%8a%9f%e4%ba%a4%e6%98%93", 
        "Card_Type"=>"0", 
        "CargoNo"=>"", 
        "ChkValue"=>"014B5457A2864B5A03A65E79430EBFF12855B17A"
      }
    end
    it "should get correct ChkValue" do 
      SuntechRails::Payment::BuySafe.check_chkvalue?(Success).must_equal true
    end

    it "should reture true" do 
      SuntechRails::Payment::BuySafe.success?(Success).must_equal true
    end

    it "should return all hash" do 
      SuntechRails::Payment::BuySafe.check(Success).must_equal Success
    end
  end

end