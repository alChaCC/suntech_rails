module SuntechRails
  module SuntechRailsHelper
    def build_post_form payment
      form_tag SuntechRails::Core::Config.config.endpoint, class: "#{payment.class.name.demodulize}-form" do   
        payment.instance_variable_names.map do |param|
          hidden_field_tag param.gsub('@',''), payment.instance_variable_get(param)
        end.join.html_safe << submit_tag('送出', class: 'btn payment-submit-btn') 
      end
    end
  end
end