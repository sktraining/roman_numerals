require 'yaml'
require 'csv'
require_relative '../lib/aws_client'
require_relative '../lib/numeral_converter'

SOLUTION_FILENAME = 'roman_numerals/roman_numeral_phase_4_solution.txt'
BUCKET_NAME = 'sktraining'

aws_creds = YAML.load_file('../config.yml')
aws_client = AwsClient.new(access_key_id: aws_creds['aws_access_key_id'], secret_access_key: aws_creds['aws_secret_access_key'], region: aws_creds['region'])
roman_file = aws_client.retrieve_object(bucket: BUCKET_NAME, key: 'roman_numerals/roman_numeral_sample_operations.csv')

OPERATORS = { 'add' => :+, 'subtract' => :-, 'divide' => :/, 'multiply' => :* }
solutions = []

CSV.new(roman_file.body, headers: true, col_sep: ', ').each do |row|
  operator = OPERATORS[row['operator']]
  left_operand = row['operandA'].to_arabic_numeral
  right_operand = row['operandB'].to_arabic_numeral
  result = left_operand.send(operator, right_operand)
  solutions << result.to_roman_numeral
end

roman_file = StringIO.new(solutions.join("\n"))
aws_client.put_object(bucket: BUCKET_NAME, key: SOLUTION_FILENAME, body: roman_file)
puts aws_client.retrieve_object(bucket: BUCKET_NAME, key: SOLUTION_FILENAME).body.string
