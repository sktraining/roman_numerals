require_relative '../csv_handler.rb'
require_relative '../roman_to_arabic_converter.rb'

describe 'csv handler' do

  let(:handler) { CSVHandler.new(RomanToArabicConverter) }

  context 'csv file is valid' do
    before do
      allow(CSV).to receive(:foreach).with(input_csv_path).and_yield('X').and_yield('IV').and_yield('CIX').and_yield('M')
    end


    context 'roman to arabic case' do

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
        expect(handler.write_converted(input_csv_path)).to eq(output_csv)
      end
    end
  end

  context 'csv file is invalid' do
    let(:invalid_input_csv_path) { './invalid_input_csv_path' }

    context "row has more than one cell" do
      before { allow(CSV).to receive(:foreach).with(invalid_input_csv_path).and_yield('X, I') }

      let(:invalid_input_csv) { [["X", "I"]] }

      specify { expect { handler.write_converted(invalid_input_csv_path) }.to raise_error("input must be a valid csv file") }
    end

    context "csv has invalid encoding" do
      let(:invalid_utf_8) { 128.chr }
      before { allow(File).to receive(:read).with(invalid_input_csv_path, :encoding => 'utf-8') { invalid_utf_8 } }

      specify { expect { handler.write_converted(invalid_input_csv_path) }.to raise_error("input must be a valid csv file") }
    end
  end
end
