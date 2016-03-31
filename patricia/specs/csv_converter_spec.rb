require_relative '../csv_converter.rb'
require_relative '../converters/roman_to_arabic_converter.rb'
require_relative '../converters/arabic_to_roman_converter.rb'

describe 'csv converter' do
  context 'csv file is valid' do
    context 'roman to arabic case' do
      before do
        allow(CSV).to receive(:foreach).with(input_csv_path).and_yield('X').and_yield('IV').and_yield('CIX').and_yield('M')
        allow(File).to receive(:read).with(input_csv_path, encoding: 'utf-8') { input_csv }
      end

      let(:converter) { CSVConverter.new(RomanToArabicConverter) }
      let(:input_csv_path) { './input_csv_path' }
      let(:input_csv_array) { ['X', 'IV', 'CIX', 'M'] }
      let(:input_csv) do
        CSV.generate do |csv|
          input_csv_array.each do |roman|
            csv << [roman]
          end
        end
      end
      let(:output_csv_array) { ['10', '4', '109', '1000'] }
      let(:output_csv) do
        CSV.generate do |csv|
          output_csv_array.each do |arabic|
            csv << [arabic]
          end
        end
      end

      it 'csv file contains converted arabic values' do
        expect(converter.convert_csv_at_path(input_csv_path)).to eq(output_csv)
      end
    end

    context 'arabic to roman case' do
      before do
        allow(CSV).to receive(:foreach).with(input_csv_path).and_yield('10').and_yield('4').and_yield('109').and_yield('1000')
        allow(File).to receive(:read).with(input_csv_path, encoding: 'utf-8') { input_csv }
      end

      let(:converter) { CSVConverter.new(ArabicToRomanConverter) }
      let(:input_csv_path) { './input_csv_path' }
      let(:input_csv_array) { ['10', '4', '109', '1000'] }
      let(:input_csv) do
        CSV.generate do |csv|
          input_csv_array.each do |arabic|
            csv << [arabic]
          end
        end
      end
      let(:output_csv_array) { ['X', 'IV', 'CIX', 'M'] }
      let(:output_csv) do
        CSV.generate do |csv|
          output_csv_array.each do |roman|
            csv << [roman]
          end
        end
      end

      it 'csv file contains converted roman values' do
        expect(converter.convert_csv_at_path(input_csv_path)).to eq(output_csv)
      end
    end
  end

  context 'csv file is invalid' do
    let(:converter) { CSVConverter.new(RomanToArabicConverter) }
    let(:invalid_input_csv_path) { './invalid_input_csv_path' }

    context "row has more than one cell" do
      before do
        allow(CSV).to receive(:foreach).with(invalid_input_csv_path).and_yield('X, I')
        allow(File).to receive(:read).with(invalid_input_csv_path, encoding: 'utf-8') { 'X, I' }
      end

      let(:invalid_input_csv) { [["X", "I"]] }

      specify { expect { converter.convert_csv_at_path(invalid_input_csv_path) }.to raise_error("input must be a valid csv file") }
    end

    context "row is nil" do
      before do
        allow(CSV).to receive(:foreach).with(invalid_input_csv_path).and_yield(nil)
        allow(File).to receive(:read).with(invalid_input_csv_path, encoding: 'utf-8') { nil }
      end

      specify { expect { converter.convert_csv_at_path(invalid_input_csv_path) }.to raise_error("input must be a valid csv file") }
    end

    context "csv has invalid encoding" do
      let(:invalid_utf_8) { "\xc2".force_encoding("UTF-8") }
      before { allow(File).to receive(:read).with(invalid_input_csv_path, encoding: 'utf-8') { invalid_utf_8 } }

      specify { expect { converter.convert_csv_at_path(invalid_input_csv_path) }.to raise_error("input must be a valid csv file") }
    end
  end
end
