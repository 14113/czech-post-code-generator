module CzechPost
  module CodeGenerator
    class SerialNumber
      attr_reader :service_id, :order_id

      def initialize(service_id, order_id, client_id = nil, client_type = nil)
        @service_id = service_id
        @order_id = order_id
        @client_id = client_id
        @client_type = client_type
      end

      def run
        "#{service_id}#{client_id}#{order_number.id}#{check_number}#{client_type}"
      end

      private

      def check_number
        @check_number ||= CzechPost::CodeGenerator::CheckDigit.new(order_number, client_id).run
      end

      def order_number
        @order_number ||= CzechPost::CodeGenerator::OrderNumber.new(order_id, client_id)
      end

      def client_id
        @client_id || CzechPost::CodeGenerator.configuration.client_id
      end

      def client_type
        @client_type || CzechPost::CodeGenerator.configuration.client_type
      end
    end
  end
end
