require_relative 'numeral_converter.rb'
describe String do
  describe '#to_arabic' do
    context 'given I' do
      let(:input) { 'I' }
      specify { expect(input.to_arabic_numeral).to eq(1) }
    end

    context 'given II' do
      let(:input) { 'II' }
      specify { expect(input.to_arabic_numeral).to eq(2) }
    end

    context 'given III' do
      let(:input) { 'III' }
      specify { expect(input.to_arabic_numeral).to eq(3) }
    end

    context 'given IV' do
      let(:input) { 'IV' }
      specify { expect(input.to_arabic_numeral).to eq(4) }
    end

    context 'given V' do
      let(:input) { 'V' }
      specify { expect(input.to_arabic_numeral).to eq(5) }
    end

    context 'given X' do
      let(:input) { 'X' }
      specify { expect(input.to_arabic_numeral).to eq(10) }
    end

    context 'given L' do
      let (:input) { 'L' }
      specify { expect(input.to_arabic_numeral).to eq(50) }
    end

    context 'given C' do
      let (:input) { 'C' }
      specify { expect(input.to_arabic_numeral).to eq(100) }
    end

    context 'given D' do
      let (:input) { 'D' }
      specify { expect(input.to_arabic_numeral).to eq(500) }
    end

    context 'given M' do
      let (:input) { 'M' }
      specify { expect(input.to_arabic_numeral).to eq(1000) }
    end
  end
end

describe Fixnum do
  describe '#to_roman_numeral' do
    context 'given 1' do
      let (:input) { 1 }
      specify { expect(input.to_roman_numeral).to eq('I') }
    end

    context 'given 2' do
      let (:input) { 2 }
      specify { expect(input.to_roman_numeral).to eq('II') }
    end

    context 'given 5' do
      let (:input) { 5 }
      specify { expect(input.to_roman_numeral).to eq('V') }
    end

    context 'given 6' do
      let (:input) { 6 }
      specify { expect(input.to_roman_numeral).to eq('VI') }
    end

    context 'given 10' do
      let (:input) { 10 }
      specify { expect(input.to_roman_numeral).to eq('X') }
    end

    context 'given 50' do
      let (:input) { 50 }
      specify { expect(input.to_roman_numeral).to eq('L') }
    end

    context 'given 100' do
      let (:input) { 100 }
      specify { expect(input.to_roman_numeral).to eq('C') }
    end

    context 'given 500' do
      let (:input) { 500 }
      specify { expect(input.to_roman_numeral).to eq('D') }
    end

    context 'given 1000' do
      let (:input) { 1000 }
      specify { expect(input.to_roman_numeral).to eq('M') }
    end
  end
end
