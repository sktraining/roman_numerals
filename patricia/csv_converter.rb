require 'csv'

class CSVConverter
  INVALID_CSV_ERROR = "input must be a valid csv file"

  def initialize(converter_klass)
    @converter_klass = converter_klass
  end

  def convert_csv(input_csv)
    validate_proper_encoding(input_csv)
    output_csv = CSV.generate do |csv|
      CSV.parse(input_csv) do |row|
        validate_csv_row(row)
        converted_value = @converter_klass.new(CSV.parse(row, converters: :numeric)[0][0]).convert
        csv << converted_value
      end
    end
  end

  def convert_csv_at_path(input_csv_path)
    validate_proper_encoding(input_csv_path)
    output_csv = CSV.generate do |csv|
      CSV.foreach(input_csv_path) do |row|
        validate_csv_row(row)
        converted_value = @converter_klass.new(CSV.parse(row, converters: :numeric)[0][0]).convert
        csv << [converted_value]
      end
    end
  end

  private

  def validate_proper_encoding(filename)
    content = File.read(filename, encoding: 'utf-8')
    raise INVALID_CSV_ERROR  unless !content.nil? && content.valid_encoding?
  end

  def validate_csv_row(row)
    raise INVALID_CSV_ERROR if CSV.parse(row)[0].count != 1
  end
end
