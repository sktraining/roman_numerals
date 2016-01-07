require_relative "./roman_numeral_converter.rb"

describe "Roman Numeral Converter" do
  context "roman numeral to arabic conversion" do
    before { @converter = RomanArabicConverter.new }

    context "roman numeral is valid" do
      context "roman numeral is one character" do
        specify { expect(@converter.convert_to_arabic("I")).to eq(1) }
        specify { expect(@converter.convert_to_arabic("V")).to eq(5) }
        specify { expect(@converter.convert_to_arabic("X")).to eq(10) }
        specify { expect(@converter.convert_to_arabic("L")).to eq(50) }
        specify { expect(@converter.convert_to_arabic("C")).to eq(100) }
        specify { expect(@converter.convert_to_arabic("D")).to eq(500) }
        specify { expect(@converter.convert_to_arabic("M")).to eq(1000) }
      end
      context "addition between roman numerals" do
        specify { expect(@converter.convert_to_arabic("CXI")).to eq(111) }
        specify { expect(@converter.convert_to_arabic("CCC")).to eq(300) }
        specify { expect(@converter.convert_to_arabic("DIX")).to eq(509) }
      end
      context "roman numerals that are two characters long" do
        specify { expect(@converter.convert_to_arabic("IV")).to eq(4) }
        specify { expect(@converter.convert_to_arabic("IX")).to eq(9) }
        specify { expect(@converter.convert_to_arabic("XL")).to eq(40) }
        specify { expect(@converter.convert_to_arabic("XC")).to eq(90) }
        specify { expect(@converter.convert_to_arabic("CD")).to eq(400) }
        specify { expect(@converter.convert_to_arabic("CM")).to eq(900) }
      end
      context "roman numerals that are complex" do
        specify { expect(@converter.convert_to_arabic("MCMXLIV")).to eq(1944)}
        specify { expect(@converter.convert_to_arabic("MMMMCCCXXI")).to eq(4321)}
      end
    end

    context "roman numeral is invalid" do
      specify { expect{ @converter.convert_to_arabic(123) }.to raise_error("input must be a string") }
      specify { expect{ @converter.convert_to_arabic("XIQ") }.to raise_error("invalid roman input") }
      specify { expect{ @converter.convert_to_arabic("BOGUS") }.to raise_error("invalid roman input") }
    end
  end

  context "arabic to roman numeral conversion" do
    before { @converter = RomanArabicConverter.new }

    context "arabic numeral is valid" do
      context "arabic numbers that convert to single roman numeral" do
        specify { expect(@converter.convert_to_roman(1)).to eq("I") }
        specify { expect(@converter.convert_to_roman(5)).to eq("V") }
        specify { expect(@converter.convert_to_roman(10)).to eq("X") }
        specify { expect(@converter.convert_to_roman(50)).to eq("L") }
        specify { expect(@converter.convert_to_roman(100)).to eq("C") }
        specify { expect(@converter.convert_to_roman(500)).to eq("D") }
        specify { expect(@converter.convert_to_roman(1000)).to eq("M") }
      end
      context "arabic number converts to multiple roman numerals" do
        specify { expect(@converter.convert_to_roman(1944)).to eq("MCMXLIV")}
        specify { expect(@converter.convert_to_roman(4321)).to eq("MMMMCCCXXI")}
      end
    end

    context "arabic numeral is invalid" do
      specify { expect{ @converter.convert_to_roman('ABC') }.to raise_error("input must be a positive integer") }
      specify { expect{ @converter.convert_to_roman(2.4) }.to raise_error("input must be a positive integer") }
      specify { expect{ @converter.convert_to_roman(-10) }.to raise_error("input must be a positive integer") }
      specify { expect{ @converter.convert_to_roman(0) }.to raise_error("input must be a positive integer") }
    end
  end
end

