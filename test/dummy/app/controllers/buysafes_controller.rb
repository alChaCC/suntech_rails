class BuysafesController < ApplicationController
  helper SuntechRails::SuntechRailsHelper
  def show
    buySafePaymentAttributes = {
        "MN" =>  "100",
        "OrderInfo" =>  "order information limit is 400",
        "Td" => "#{Time.now.to_i}-#{params[:id]}",
        "sna" => "aloha",
        "sdt" => "0912345678",
        "email" => 'y.alohac@gmail.com',
        "note1" => 'none',
        "note2" => "none",
        "Card_Type" => '0',
        "Country_Type" => 'EN'
      }
    @buysafe_payment = SuntechRails::Payment::BuySafe.new(buySafePaymentAttributes)
  end
end
