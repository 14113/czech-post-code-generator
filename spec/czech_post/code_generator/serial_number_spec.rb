require 'spec_helper'

describe CzechPost::CodeGenerator::SerialNumber do
  describe 'with manual client_id and client_type' do
    let(:client_id) { 7038 }
    let(:client_type) { 'C' }
    context 'valid number' do
      let(:service) { CzechPost::CodeGenerator::SerialNumber.new('DR', '00202', client_id, client_type) }

      context 'with DR service' do
        it '#run' do
          expect(service.run).to eq('DR7038002027C')
        end
      end

      context 'with P service' do
        let(:service) { CzechPost::CodeGenerator::SerialNumber.new('P', 1, client_id, client_type) }
        it '#run' do
          expect(service.run).to eq('P7038000012C')
        end
      end
    end
  end

  describe 'with config client_id and client_type' do
    let!(:config) do
      CzechPost::CodeGenerator.configure do |config|
        config.client_id = 7039
        config.client_type = 'D'
      end
    end
    context 'valid number' do
      let(:service) { CzechPost::CodeGenerator::SerialNumber.new('DR', '00202') }

      context 'with DR service' do
        it '#run' do
          expect(service.run).to eq('DR7039002023D')
        end
      end

      context 'with P service' do
        let(:service) { CzechPost::CodeGenerator::SerialNumber.new('P', 1) }
        it '#run' do
          expect(service.run).to eq('P7039000019D')
        end
      end
    end
  end
end
