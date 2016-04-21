require 'aws-sdk'

class AWSHandler
  def self.instance
    @instance ||= new
  end

  def read_file(bucket, key)
    client.get_object(bucket: bucket, key: key).body.read
  end

  def write_file(bucket, key, body)
    obj = resource.bucket(bucket).object(key)
    obj.put(body: body)
  end

  private
  def initialize
    config
  end

  def config
    aws_config = JSON.load(File.read('config/aws.json'))
    Aws.config.update({
      region: 'us-east-1',
      credentials: Aws::Credentials.new(aws_config['ACCESS_KEY_ID'], aws_config['SECRET_ACCESS_KEY'])
    })
  end

  def client
    @client ||= Aws::S3::Client.new
  end

  def resource
    Aws::S3::Resource.new(region:'us-east-1')
  end
end
