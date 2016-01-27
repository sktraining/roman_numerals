require 'yaml'
require 'aws-sdk-core'
aws_creds = YAML.load_file('config.yml')

access_key = aws_creds['aws_secret_access_key']
aws_access_key_id = aws_creds['aws_access_key_id']
credentials = Aws::Credentials.new(aws_access_key_id, access_key)
s3_client = Aws::S3::Client.new(region: 'us-east-1', credentials: credentials)
resp = s3_client.get_object(bucket: 'sktraining', key: 'roman_numerals/roman_numeral_sample.txt')


puts resp.body.string

