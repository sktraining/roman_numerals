require_relative "../roman_to_arabic_converter.rb"

describe "Roman to Arabic Numeral Converter" do
  context "roman numeral is valid" do
    context "roman numeral is one character" do
      specify { expect(RomanToArabicConverter.new("I").convert).to eq(1) }
      specify { expect(RomanToArabicConverter.new("V").convert).to eq(5) }
      specify { expect(RomanToArabicConverter.new("X").convert).to eq(10) }
      specify { expect(RomanToArabicConverter.new("L").convert).to eq(50) }
      specify { expect(RomanToArabicConverter.new("C").convert).to eq(100) }
      specify { expect(RomanToArabicConverter.new("D").convert).to eq(500) }
      specify { expect(RomanToArabicConverter.new("M").convert).to eq(1000) }
    end
    context "addition between roman numerals" do
      specify { expect(RomanToArabicConverter.new("CXI").convert).to eq(111) }
      specify { expect(RomanToArabicConverter.new("CCC").convert).to eq(300) }
      specify { expect(RomanToArabicConverter.new("DIX").convert).to eq(509) }
    end
    context "roman numerals that are two characters long" do
      specify { expect(RomanToArabicConverter.new("IV").convert).to eq(4) }
      specify { expect(RomanToArabicConverter.new("IX").convert).to eq(9) }
      specify { expect(RomanToArabicConverter.new("XL").convert).to eq(40) }
      specify { expect(RomanToArabicConverter.new("XC").convert).to eq(90) }
      specify { expect(RomanToArabicConverter.new("CD").convert).to eq(400) }
      specify { expect(RomanToArabicConverter.new("CM").convert).to eq(900) }
    end
    context "roman numerals that are complex" do
      specify { expect(RomanToArabicConverter.new("MCMXLIV").convert).to eq(1944)}
      specify { expect(RomanToArabicConverter.new("MMMMCCCXXI").convert).to eq(4321)}
    end
  end

  context "roman numeral is invalid" do
    specify { expect{ RomanToArabicConverter.new(123).convert }.to raise_error("input must be a string") }
    specify { expect{ RomanToArabicConverter.new("XIQ").convert }.to raise_error("invalid roman input") }
    specify { expect{ RomanToArabicConverter.new("BOGUS").convert }.to raise_error("invalid roman input") }
  end
end
