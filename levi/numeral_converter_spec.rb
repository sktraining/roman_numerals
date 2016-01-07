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

  describe '.convert_arabic_to_roman' do
    context 'given 1' do
      let (:input) { 1 }
      specify { expect(described_class.convert_arabic_to_roman(input)).to eq('I') }
    end

    context 'given 2' do
      let (:input) { 2 }
      specify { expect(described_class.convert_arabic_to_roman(input)).to eq('II') }
    end

    context 'given 5' do
      let (:input) { 5 }
      specify { expect(described_class.convert_arabic_to_roman(input)).to eq('V') }
    end

    context 'given 6' do
      let (:input) { 6 }
      specify { expect(described_class.convert_arabic_to_roman(input)).to eq('VI') }
    end

    context 'given 10' do
      let (:input) { 10 }
      specify { expect(described_class.convert_arabic_to_roman(input)).to eq('X') }
    end

    context 'given 50' do
      let (:input) { 50 }
      specify { expect(described_class.convert_arabic_to_roman(input)).to eq('L') }
    end

    context 'given 100' do
      let (:input) { 100 }
      specify { expect(described_class.convert_arabic_to_roman(input)).to eq('C') }
    end

    context 'given 500' do
      let (:input) { 500 }
      specify { expect(described_class.convert_arabic_to_roman(input)).to eq('D') }
    end

    context 'given 1000' do
      let (:input) { 1000 }
      specify { expect(described_class.convert_arabic_to_roman(input)).to eq('M') }
    end
  end
end
