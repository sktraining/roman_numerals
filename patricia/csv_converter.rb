require 'csv'

class CSVConverter
  INVALID_CSV_ERROR = "input must be a valid csv file"

  def initialize(converter_klass)
    @converter_klass = converter_klass
  end

  def convert_csv(input_csv)
    validate_csv_is_not_nil(input_csv)
    output_csv = CSV.generate do |csv|
      CSV.parse(input_csv, converters: :numeric) do |parsed_row|
        csv << [convert_first_element(parsed_row)]
      end
    end
  end

  def convert_csv_at_path(input_csv_path)
    validate_proper_encoding(input_csv_path)
    output_csv = CSV.generate do |csv|
      CSV.foreach(input_csv_path) do |csv_row|
        parsed_row = CSV.parse(csv_row, converters: :numeric)[0]
        csv << [convert_first_element(parsed_row)]
      end
    end
  end

  private

  def convert_first_element(parsed_row)
    validate_csv_row(parsed_row)
    @converter_klass.new(parsed_row[0]).convert
  end

  def validate_proper_encoding(filename)
    content = File.read(filename, encoding: 'utf-8')
    raise INVALID_CSV_ERROR  unless !content.nil? && content.valid_encoding?
  end

  def validate_csv_row(parsed_row)
    raise INVALID_CSV_ERROR if parsed_row.count != 1
  end

  def validate_csv_is_not_nil(csv)
    raise INVALID_CSV_ERROR if csv.nil?
  end
end
