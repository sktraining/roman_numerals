require 'csv'

class CSVHandler
  INVALID_CSV_ERROR = "input must be a valid csv file"

  def initialize(converter_klass)
    @converter_klass = converter_klass
  end

  def write_converted(input_csv_path)
    validate_proper_encoding(input_csv_path)
    output_csv = CSV.generate do |csv|
        CSV.foreach(input_csv_path) do |row|
          validate_csv_row(row)
          converted_value = @converter_klass.new(CSV.parse(row)[0][0]).convert
          csv << [converted_value]
        end
      end
  end

  private

# def csv?(filename, sep: ';', columns: 3)
#   return false unless File.exist?(filename) #"No file"
#   content = File.read(filename, :encoding => 'utf-8')
#   return false unless content.valid_encoding? #"Wrong encoding"

#   content.each_line{|line|
#     return false if line.count(sep) < columns - 1
#   }
#   CSV.parse(content, :col_sep => sep)

# end

  def validate_proper_encoding(filename)
    content = File.read(filename, :encoding => 'utf-8')
    raise INVALID_CSV_ERROR  unless content.valid_encoding?
  end

  def validate_csv_row(row)
    raise INVALID_CSV_ERROR if CSV.parse(row)[0].count != 1
  end
end
