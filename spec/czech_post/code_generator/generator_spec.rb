require 'spec_helper'

describe CzechPost::CodeGenerator do
  let!(:config) do
    CzechPost::CodeGenerator.configure do |config|
      config.client_id = 7039
      config.client_type = 'D'
    end
  end

  it 'has a version number' do
    expect(CzechPost::CodeGenerator::VERSION).to eq '0.1.0'
  end

  it 'use configuration' do
    expect(CzechPost::CodeGenerator.configuration.client_id).to eq(7039)
    expect(CzechPost::CodeGenerator.configuration.client_type).to eq('D')
  end
end
