class AWSFileConverter
  def init(from_bucket: , to_bucket:, from_key:, to_key:, converter_klass:)
    # csv_to_convert = AWSHandler.instance.read_file(from_bucket, from_key)
    # converted_csv = CSVHandler.new(converter).convert_csv(csv_to_convert)
    # AWSHandler.instance.write_file(to_bucket, to_key, converted_csv)
  end
end
