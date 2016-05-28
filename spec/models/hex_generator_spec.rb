require 'rails_helper'

describe HexGenerator do
  let(:hex) { described_class.new_hex }
  let(:valid_hex_values) { %w(a b c d e f 0 1 2 3 4 5 6 7 8 9) }

  describe "#new_hex" do
    it 'begins with a pound sign' do
      expect(hex).to start_with "#"
    end

    it 'has 6 additional characters' do
    hex.delete!("#")

    expect(hex.length).to eq 6
    end

    it 'outputs valid hex values' do
      hex_without_pound = hex[1..-1].split("")
      hex_without_pound.each { |char| expect(valid_hex_values).to include char }
    end
  end
end