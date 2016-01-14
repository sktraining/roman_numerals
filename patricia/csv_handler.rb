class CSVHandler
  def initialize(converter)
    @converter = converter
  end

  def write_converted(input_csv_path)
    output_csv = CSV.generate do |csv|
        CSV.foreach(input_csv_path) do |row|
          input_value = CSV.parse(row)[0]
          converted_value = @converter.new(input_value).convert
          csv << [converted_value]
        end
      end
  end
end
