require_relative '../aws_handler'
require_relative '../csv_converter'
require_relative '../aws_file_converter'

describe AWSFileConverter do
  describe '#initialize' do
    let(:from_bucket) { 'from_bucket' }
    let(:to_bucket) { 'to_bucket' }
    let(:from_key) { 'from_key' }
    let(:to_key) { 'to_key' }
    let(:converter_klass) { 'converter_klass' }
    let(:aws_handler_instance) { double('aws-handler-instance') }
    let(:csv_converter) { double('csv_converter') }
    let(:csv_to_convert) { 'csv_to_convert' }

    before do
      allow(AWSHandler).to receive(:instance) { aws_handler_instance }
      allow(CSVConverter).to receive(:new) { csv_converter}
      allow(csv_converter).to receive(:convert_csv)
      allow(aws_handler_instance).to receive(:read_file).with(from_bucket, from_key) { csv_to_convert }
      allow(aws_handler_instance).to receive(:write_file)
      described_class.new(from_bucket: from_bucket, to_bucket: to_bucket, from_key: from_key, to_key: to_key, converter_klass: converter_klass)
    end

    specify { expect(aws_handler_instance).to have_received(:read_file).with(from_bucket, from_key) }

    specify { expect(CSVConverter).to have_received(:new).with(converter_klass) }

    specify { expect(csv_converter).to have_received(:convert_csv).with(csv_to_convert) }
  end
end
