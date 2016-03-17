require 'yaml'
require_relative '../lib/aws_client'
require_relative '../lib/numeral_converter'

SOLUTION_FILENAME = 'roman_numerals/roman_numeral_sample_solution.txt'
BUCKET_NAME = 'sktraining'

aws_creds = YAML.load_file('../config.yml')
aws_client = AwsClient.new(access_key_id: aws_creds['aws_access_key_id'], secret_access_key: aws_creds['aws_secret_access_key'], region: aws_creds['region'])
roman_file = aws_client.retrieve_object(bucket: BUCKET_NAME, key: 'roman_numerals/roman_numeral_sample.txt')

roman_array = roman_file.body.string.split("\n")
arabic_array = roman_array.map(&:to_arabic_numeral)
arabic_file = StringIO.new(arabic_array.map(&:to_s).join("\n"))
aws_client.put_object(bucket: BUCKET_NAME, key: SOLUTION_FILENAME, body: arabic_file)

puts aws_client.retrieve_object(bucket: BUCKET_NAME, key: SOLUTION_FILENAME).body.string
