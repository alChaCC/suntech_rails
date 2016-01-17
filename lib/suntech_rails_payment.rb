require 'suntech_rails_core'

module SuntechRails
  module Payment
     autoload :BuySafe, "suntech_rails/payment/buysafe"
     include Core::Exceptions
  end
end