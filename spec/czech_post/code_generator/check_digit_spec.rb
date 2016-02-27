require 'spec_helper'

describe CzechPost::CodeGenerator::CheckDigit do
  let(:client_id) { 7038 }
  context 'valid order number' do
    let(:number) { CzechPost::CodeGenerator::OrderNumber.new(12_345, client_id) }
    let(:service) { CzechPost::CodeGenerator::CheckDigit.new(number, client_id) }
    context 'methods' do
      it '#modulo' do
        expect(service.send(:modulo)).to eq(8)
      end

      it '#sum' do
        expect(service.send(:sum)).to eq(151)
      end

      it '#times_digit' do
        expect(service.send(:times_digit)).to eq([7, 0, 18, 32, 2, 6, 15, 36, 35])
      end

      it '#get_number_by_index' do
        expect(service.send(:get_number_by_index, 1)).to eq(0)
        expect(service.send(:get_number_by_index, 8)).to eq(5)
      end

      it '#valid?' do
        expect(service.valid?).to eq(true)
      end

      it '#run' do
        expect(service.run).to eq(3)
      end
    end
  end

  context 'different valid order number' do
    let(:number) { CzechPost::CodeGenerator::OrderNumber.new('00123', client_id) }
    let(:service) { CzechPost::CodeGenerator::CheckDigit.new(number, client_id) }
    context 'methods' do
      it '#modulo' do
        expect(service.send(:modulo)).to eq(2)
      end

      it '#sum' do
        expect(service.send(:sum)).to eq(101)
      end

      it '#times_digit' do
        expect(service.send(:times_digit)).to eq([7, 0, 18, 32, 0, 0, 5, 18, 21])
      end

      it '#get_number_by_index' do
        expect(service.send(:get_number_by_index, 1)).to eq(0)
        expect(service.send(:get_number_by_index, 8)).to eq(3)
      end

      it '#valid?' do
        expect(service.valid?).to eq(true)
      end

      it '#run' do
        expect(service.run).to eq(9)
      end
    end
  end
end
