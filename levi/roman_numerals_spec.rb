require_relative 'roman_numerals.rb'
describe RomanNumerals do
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
  end
end
