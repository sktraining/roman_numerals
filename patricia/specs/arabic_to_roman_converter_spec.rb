require_relative "../arabic_to_roman_converter.rb"

describe "Arabic to Roman Converter" do
  context "arabic numeral is valid" do
    context "arabic numbers that convert to single roman numeral" do
      specify { expect(ArabicToRomanConverter.new(1).convert).to eq("I") }
      specify { expect(ArabicToRomanConverter.new(5).convert).to eq("V") }
      specify { expect(ArabicToRomanConverter.new(10).convert).to eq("X") }
      specify { expect(ArabicToRomanConverter.new(50).convert).to eq("L") }
      specify { expect(ArabicToRomanConverter.new(100).convert).to eq("C") }
      specify { expect(ArabicToRomanConverter.new(500).convert).to eq("D") }
      specify { expect(ArabicToRomanConverter.new(1000).convert).to eq("M") }
    end
    context "arabic number converts to multiple roman numerals" do
      specify { expect(ArabicToRomanConverter.new(1944).convert).to eq("MCMXLIV")}
      specify { expect(ArabicToRomanConverter.new(4321).convert).to eq("MMMMCCCXXI")}
    end
  end

  context "arabic numeral is invalid" do
    specify { expect{ ArabicToRomanConverter.new('ABC').convert }.to raise_error("input must be a positive integer") }
    specify { expect{ ArabicToRomanConverter.new(2.4).convert }.to raise_error("input must be a positive integer") }
    specify { expect{ ArabicToRomanConverter.new(-10).convert }.to raise_error("input must be a positive integer") }
    specify { expect{ ArabicToRomanConverter.new(0).convert }.to raise_error("input must be a positive integer") }
  end
end
