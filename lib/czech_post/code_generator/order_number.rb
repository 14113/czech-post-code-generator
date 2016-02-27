module CzechPost
  module CodeGenerator
    class OrderNumber
      MAX_SIZE = 9

      attr_reader :order_id, :client_id

      def initialize(order_id, client_id)
        @order_id = order_id.to_s
        @client_id = client_id.to_s
        raise(CzechPost::CodeGenerator::Errors::InvalidOrderNumberId, order_id) unless valid?
      end

      def id
        @id ||= order_id.to_s.rjust(size, '0')
      end

      def valid?
        return false if order_id == '' || client_id == ''
        id.length == size
      end

      def size
        MAX_SIZE - client_id.length
      end
    end
  end
end
