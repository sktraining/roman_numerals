require_relative "../roman_to_arabic_converter.rb"

describe RomanToArabicConverter do
  context "roman numeral is valid" do
    context "roman numeral is one character" do
      specify { expect(described_class.new("I").convert).to eq(1) }
      specify { expect(described_class.new("V").convert).to eq(5) }
      specify { expect(described_class.new("X").convert).to eq(10) }
      specify { expect(described_class.new("L").convert).to eq(50) }
      specify { expect(described_class.new("C").convert).to eq(100) }
      specify { expect(described_class.new("D").convert).to eq(500) }
      specify { expect(described_class.new("M").convert).to eq(1000) }
    end
    context "addition between roman numerals" do
      specify { expect(described_class.new("CXI").convert).to eq(111) }
      specify { expect(described_class.new("CCC").convert).to eq(300) }
      specify { expect(described_class.new("DIX").convert).to eq(509) }
    end
    context "roman numerals that are two characters long" do
      specify { expect(described_class.new("IV").convert).to eq(4) }
      specify { expect(described_class.new("IX").convert).to eq(9) }
      specify { expect(described_class.new("XL").convert).to eq(40) }
      specify { expect(described_class.new("XC").convert).to eq(90) }
      specify { expect(described_class.new("CD").convert).to eq(400) }
      specify { expect(described_class.new("CM").convert).to eq(900) }
    end
    context "roman numerals that are complex" do
      specify { expect(described_class.new("MCMXLIV").convert).to eq(1944)}
      specify { expect(described_class.new("MMMMCCCXXI").convert).to eq(4321)}
    end
  end

  context "roman numeral is invalid" do
    specify { expect{ described_class.new(123).convert }.to raise_error("input must be a string") }
    specify { expect{ described_class.new("XIQ").convert }.to raise_error("invalid roman input") }
    specify { expect{ described_class.new("BOGUS").convert }.to raise_error("invalid roman input") }
  end
end
