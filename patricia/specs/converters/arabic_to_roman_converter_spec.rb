require_relative "../../converters/arabic_to_roman_converter.rb"

describe ArabicToRomanConverter do
  describe "#convert" do
    context "arabic numeral is valid" do
      context "arabic numbers that convert to single roman numeral" do
        let(:input) { [1, 5, 10, 50, 100, 500, 1000] }
        let(:results) { %w(I V X L C D M) }

        specify do
          aggregate_failures "converts to the correct roman numeral" do
            Hash[input.zip(results)].each do |input, result|
              expect(described_class.new(input).convert).to eq(result)
            end
          end
        end
      end

      context "arabic number converts to multiple roman numerals" do
         let(:input) { [1944, 4321] }
        let(:results) { %w(MCMXLIV MMMMCCCXXI) }

        specify do
          aggregate_failures "converts to the correct roman numerals" do
            Hash[input.zip(results)].each do |input, result|
              expect(described_class.new(input).convert).to eq(result)
            end
          end
        end
      end
    end

    context "arabic numeral is invalid" do
      specify { expect{ described_class.new('ABC').convert }.to raise_error("input must be a positive integer") }
      specify { expect{ described_class.new(2.4).convert }.to raise_error("input must be a positive integer") }
      specify { expect{ described_class.new(-10).convert }.to raise_error("input must be a positive integer") }
      specify { expect{ described_class.new(0).convert }.to raise_error("input must be a positive integer") }
    end
  end
end
