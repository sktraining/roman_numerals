require_relative "../arabic_to_roman_converter.rb"

describe ArabicToRomanConverter do
  context "arabic numeral is valid" do
    context "arabic numbers that convert to single roman numeral" do
      specify { expect(described_class.new(1).convert).to eq("I") }
      specify { expect(described_class.new(5).convert).to eq("V") }
      specify { expect(described_class.new(10).convert).to eq("X") }
      specify { expect(described_class.new(50).convert).to eq("L") }
      specify { expect(described_class.new(100).convert).to eq("C") }
      specify { expect(described_class.new(500).convert).to eq("D") }
      specify { expect(described_class.new(1000).convert).to eq("M") }
    end
    context "arabic number converts to multiple roman numerals" do
      specify { expect(described_class.new(1944).convert).to eq("MCMXLIV")}
      specify { expect(described_class.new(4321).convert).to eq("MMMMCCCXXI")}
    end
  end

  context "arabic numeral is invalid" do
    specify { expect{ described_class.new('ABC').convert }.to raise_error("input must be a positive integer") }
    specify { expect{ described_class.new(2.4).convert }.to raise_error("input must be a positive integer") }
    specify { expect{ described_class.new(-10).convert }.to raise_error("input must be a positive integer") }
    specify { expect{ described_class.new(0).convert }.to raise_error("input must be a positive integer") }
  end
end
