require_relative "../../converters/roman_to_arabic_converter.rb"

describe RomanToArabicConverter do
  describe "#convert" do
    context "roman numeral is valid" do
      context "roman numeral is one character" do

        let(:input) { %w(I V X L C D M) }
        let(:results) { [1, 5, 10, 50, 100, 500, 1000] }

        specify do
          aggregate_failures "converts to the correct arabic digit" do
            Hash[input.zip(results)].each do |input, result|
              expect(described_class.new(input.dup).convert).to eq(result)
            end
          end
        end
      end

      context "addition between roman numerals" do
        let(:input) { %w(CXI CCC DIX) }
        let(:results) { [111, 300, 509] }

        specify do
          aggregate_failures "performs addition correctly" do
            Hash[input.zip(results)].each do |input, result|
              expect(described_class.new(input.dup).convert).to eq(result)
            end
          end
        end
      end

      context "roman numerals that are two characters long" do
        let(:input) { %w(IV IX XL XC CD CM) }
        let(:results) { [4, 9, 40, 90, 400, 900] }

        specify do
          aggregate_failures "converts two-digit roman numerals to the correct arabic digit" do
            Hash[input.zip(results)].each do |input, result|
              expect(described_class.new(input.dup).convert).to eq(result)
            end
          end
        end
      end

      context "roman numerals that are complex" do
        let(:input) { %w(MCMXLIV MMMMCCCXXI) }
        let(:results) { [1944, 4321] }

        specify do
          aggregate_failures "converts complex roman numerals to the correct arabic digit" do
            Hash[input.zip(results)].each do |input, result|
              expect(described_class.new(input.dup).convert).to eq(result)
            end
          end
        end
      end
    end

    context "roman numeral contains lowercase letters" do
       let(:input) { %w(i v x l c d m mcmxLIV mmmMccCXxi) }
        let(:results) { [1, 5, 10, 50, 100, 500, 1000, 1944, 4321] }

        specify do
          aggregate_failures "converts to the correct arabic digit" do
            Hash[input.zip(results)].each do |input, result|
              expect(described_class.new(input.dup).convert).to eq(result)
            end
          end
        end
    end

    context "roman numeral is invalid" do
      specify { expect{ described_class.new(123).convert }.to raise_error("input must be a string") }
      specify { expect{ described_class.new("XIQ").convert }.to raise_error("invalid roman input") }
      specify { expect{ described_class.new("BOGUS").convert }.to raise_error("invalid roman input") }
    end
  end
end
