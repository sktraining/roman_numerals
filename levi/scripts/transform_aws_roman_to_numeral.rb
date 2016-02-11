require 'yaml'
require_relative '../lib/aws_client'
require_relative '../lib/numeral_converter'

aws_creds = YAML.load_file('../config.yml')
aws_client = AwsClient.new(access_key_id: aws_creds['aws_access_key_id'], secret_access_key: aws_creds['aws_secret_access_key'], region: aws_creds['region'])
roman_file = aws_client.retrieve_object(bucket: 'sktraining', key: 'roman_numerals/roman_numeral_sample.txt')

roman_array = roman_file.body.string.split("\n")
arabic_array = roman_array.map(&:to_arabic_numeral)
puts arabic_array
