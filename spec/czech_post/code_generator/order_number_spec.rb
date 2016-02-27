require 'spec_helper'

describe CzechPost::CodeGenerator::OrderNumber do
  context 'valid number' do
    let(:number) { CzechPost::CodeGenerator::OrderNumber.new(12_345, 7038) }
    context 'methods' do
      it '#id' do
        expect(number.id).to eq('12345')
      end

      it '#valid?' do
        expect(number.valid?).to eq(true)
      end

      it '#size' do
        expect(number.size).to eq(5)
      end
    end
  end

  context 'valid order with 00' do
    let(:number) { CzechPost::CodeGenerator::OrderNumber.new('00345', 38) }
    context 'methods' do
      it '#id' do
        expect(number.id).to eq('0000345')
      end

      it '#valid?' do
        expect(number.valid?).to eq(true)
      end

      it '#size' do
        expect(number.size).to eq(7)
      end
    end
  end

  context 'blank order number' do
    let(:number) { CzechPost::CodeGenerator::OrderNumber.new('', 7038) }
    context 'methods' do
      it '#id' do
        expect { number.id }.to raise_error(CzechPost::CodeGenerator::Errors::InvalidOrderNumberId)
      end

      it '#valid?' do
        expect { number.valid? }.to raise_error(CzechPost::CodeGenerator::Errors::InvalidOrderNumberId)
      end
    end
  end

  context 'empty order number' do
    let(:number) { CzechPost::CodeGenerator::OrderNumber.new(nil, 7038) }
    context 'methods' do
      it '#id' do
        expect { number.id }.to raise_error(CzechPost::CodeGenerator::Errors::InvalidOrderNumberId)
      end

      it '#valid?' do
        expect { number.valid? }.to raise_error(CzechPost::CodeGenerator::Errors::InvalidOrderNumberId)
      end
    end
  end

  context 'empty client_id' do
    let(:number) { CzechPost::CodeGenerator::OrderNumber.new(12_345, nil) }
    context 'methods' do
      it '#id' do
        expect { number.id }.to raise_error(CzechPost::CodeGenerator::Errors::InvalidOrderNumberId)
      end

      it '#valid?' do
        expect { number.valid? }.to raise_error(CzechPost::CodeGenerator::Errors::InvalidOrderNumberId)
      end
    end
  end
end
