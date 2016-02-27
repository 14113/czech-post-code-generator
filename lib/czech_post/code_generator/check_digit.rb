module CzechPost
  module CodeGenerator
    class CheckDigit
      DIGIT = [1, 8, 6, 4, 2, 3, 5, 9, 7].freeze # 186_423_597
      SIZE = 8

      attr_reader :order, :client_id

      def initialize(order, client_id)
        @order = order
        @client_id = client_id
      end

      def run
        if modulo > 1
          11 - modulo
        elsif modulo == 0
          5
        elsif modulo == 1
          0
        end
      end

      def valid?
        size == SIZE
      end

      private

      def get_number_by_index(index)
        full_number.to_s[index].to_i
      end

      def times_digit
        (0..SIZE).map do |index|
          DIGIT[index].to_i * get_number_by_index(index)
        end
      end

      def full_number
        "#{client_id}#{order.id}"
      end

      def size
        @size ||= full_number.size - 1
      end

      def sum
        @sum ||= times_digit.inject { |a, e| a + e }
      end

      def modulo(value = 11)
        @modulo ||= sum % value
      end
    end
  end
end
