require_relative '../csv_handler.rb'

describe 'csv handler' do
  context 'csv file is valid' do
    before do
      allow(CSV).to receive(:read).with(input_csv_path) { input_csv }
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
      let(:ouput_csv_array) { ['10', '9', '109', '1000'] }
      let(:ouput_csv) do
        CSV.generate do |csv|
          output_csv_array.each do |arabic|
            csv << [arabic]
          end
        end
      end
      let(:handler) { CSVHandler.new(RomanToArabicConverter.new) }

      it 'csv file contains converted arabic values' do
        expect(handler.write_converted(input_csv_path)).to eq(output_csv)
      end
    end
  end

  context 'csv file is invalid' do

  end
end
