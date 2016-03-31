require_relative 'aws_handler'
require_relative 'csv_converter'

class AWSFileConverter
  def initialize(from_bucket: , to_bucket:, from_key:, to_key:, converter_klass:)
    csv_to_convert = AWSHandler.instance.read_file(from_bucket, from_key)
    converted_csv = CSVConverter.new(converter_klass).convert_csv(csv_to_convert)
    AWSHandler.instance.write_file(to_bucket, to_key, converted_csv)
  end
end
