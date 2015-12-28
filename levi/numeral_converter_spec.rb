require_relative 'numeral_converter.rb'
describe NumeralConverter do
  describe '.convert_roman_to_arabic' do
    context 'given I' do
      let(:input) { 'I' }
      specify { expect(described_class.convert_roman_to_arabic(input)).to eq(1) }
    end

    context 'given II' do
      let(:input) { 'II' }
      specify { expect(described_class.convert_roman_to_arabic(input)).to eq(2) }
    end

    context 'given III' do
      let(:input) { 'III' }
      specify { expect(described_class.convert_roman_to_arabic(input)).to eq(3) }
    end

    context 'given IV' do
      let(:input) { 'IV' }
      specify { expect(described_class.convert_roman_to_arabic(input)).to eq(4) }
    end

    context 'given V' do
      let(:input) { 'V' }
      specify { expect(described_class.convert_roman_to_arabic(input)).to eq(5) }
    end

    context 'given X' do
      let(:input) { 'X' }
      specify { expect(described_class.convert_roman_to_arabic(input)).to eq(10) }
    end

    context 'given L' do
      let (:input) { 'L' }
      specify { expect(described_class.convert_roman_to_arabic(input)).to eq(50) }
    end

    context 'given C' do
      let (:input) { 'C' }
      specify { expect(described_class.convert_roman_to_arabic(input)).to eq(100) }
    end

    context 'given D' do
      let (:input) { 'D' }
      specify { expect(described_class.convert_roman_to_arabic(input)).to eq(500) }
    end

    context 'given M' do
      let (:input) { 'M' }
      specify { expect(described_class.convert_roman_to_arabic(input)).to eq(1000) }
    end
  end
end
