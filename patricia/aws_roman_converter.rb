require_relative 'converters/roman_to_arabic_converter'
require_relative 'aws_file_converter'

class AWSRomanConverter
  def convert_roman_numerals_file
    AWSFileConverter.new(from_bucket: 'sktraining', to_bucket: 'sktraining', from_key: 'roman_numerals/roman_numeral_sample.txt', to_key: 'roman_numerals/patricia.csv', converter_klass: RomanToArabicConverter)
  end
end
