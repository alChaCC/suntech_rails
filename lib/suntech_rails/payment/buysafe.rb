module SuntechRails
  module Payment
    class BuySafe 
      attr_accessor :web, :ChkValue, :MN, :OrderInfo, :Td, :sna, :sdt,
        :email, :note1, :note2, :Card_Type, :Country_Type
    
      DEFAULT_MODE    = :sandbox
      MODES           = [ :live, :sandbox ]

      def initialize(options = {})
        @web = SuntechRails::Core::Config.config.buy_safe_id
        merge!(options)
        @ChkValue = generate_chkvalue
      end

      def generate_chkvalue
        Digest::SHA1.hexdigest("#{@web}#{SuntechRails::Core::Config.config.transaction_code}#{@MN}").upcase
      end

      def merge!(options, &block)
        if options.is_a? Hash
          options.each do |key, value|
            set(key, value)
          end
        else
          raise ArgumentError, "invalid data(#{options.inspect}) for #{self.class.name} class"
        end
        self.instance_eval(&block) if block
        self
      end

      # Set value for given member
      # === Arguments
      # * <tt>key</tt> -- member name
      # * <tt>value</tt> -- value for member
      def set(key, value)
        send("#{key}=", value)
      rescue NoMethodError => error
        SuntechRails.logger.warn error.message
      rescue TypeError, ArgumentError => error
        raise TypeError, "#{error.message}(#{value.inspect}) for #{self.class.name}.#{key} member"
      end

    end
  end
end