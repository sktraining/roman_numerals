require_relative '../../lib/numeral_converter.rb'

describe String do
  describe '#to_arabic' do
    context 'given I' do
      subject { 'I' }
      specify { expect(subject.to_arabic_numeral).to eq(1) }
    end

    context 'given II' do
      subject { 'II' }
      specify { expect(subject.to_arabic_numeral).to eq(2) }
    end

    context 'given III' do
      subject { 'III' }
      specify { expect(subject.to_arabic_numeral).to eq(3) }
    end

    context 'given IV' do
      subject { 'IV' }
      specify { expect(subject.to_arabic_numeral).to eq(4) }
    end

    context 'given V' do
      subject { 'V' }
      specify { expect(subject.to_arabic_numeral).to eq(5) }
    end

    context 'given X' do
      subject { 'X' }
      specify { expect(subject.to_arabic_numeral).to eq(10) }
    end

    context 'given L' do
      subject { 'L' }
      specify { expect(subject.to_arabic_numeral).to eq(50) }
    end

    context 'given C' do
      subject { 'C' }
      specify { expect(subject.to_arabic_numeral).to eq(100) }
    end

    context 'given D' do
      subject { 'D' }
      specify { expect(subject.to_arabic_numeral).to eq(500) }
    end

    context 'given M' do
      subject { 'M' }
      specify { expect(subject.to_arabic_numeral).to eq(1000) }
    end
  end
end

describe Fixnum do
  describe '#to_roman_numeral' do
    context 'given 1' do
      subject { 1 }
      specify { expect(subject.to_roman_numeral).to eq('I') }
    end

    context 'given 2' do
      subject { 2 }
      specify { expect(subject.to_roman_numeral).to eq('II') }
    end

    context 'given 4' do
      subject { 4 }
      specify { expect(subject.to_roman_numeral).to eq('IV') }
    end

    context 'given 5' do
      subject { 5 }
      specify { expect(subject.to_roman_numeral).to eq('V') }
    end

    context 'given 6' do
      subject { 6 }
      specify { expect(subject.to_roman_numeral).to eq('VI') }
    end

    context 'given 9' do
      subject { 9 }
      specify { expect(subject.to_roman_numeral).to eq('IX') }
    end

    context 'given 10' do
      subject { 10 }
      specify { expect(subject.to_roman_numeral).to eq('X') }
    end

    context 'given 40' do
      subject { 40 }
      specify { expect(subject.to_roman_numeral).to eq('XL') }
    end

    context 'given 50' do
      subject { 50 }
      specify { expect(subject.to_roman_numeral).to eq('L') }
    end

    context 'given 100' do
      subject { 100 }
      specify { expect(subject.to_roman_numeral).to eq('C') }
    end

    context 'given 400' do
      subject { 400 }
      specify { expect(subject.to_roman_numeral).to eq('CD') }
    end

    context 'given 500' do
      subject { 500 }
      specify { expect(subject.to_roman_numeral).to eq('D') }
    end

    context 'given 1000' do
      subject { 1000 }
      specify { expect(subject.to_roman_numeral).to eq('M') }
    end
  end
end
