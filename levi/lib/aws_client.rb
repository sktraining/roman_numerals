require 'aws-sdk-core'

class AwsClient
  def initialize(params)
    credentials = Aws::Credentials.new(params[:access_key_id], params[:secret_access_key])
    @client = Aws::S3::Client.new(region: params[:region], credentials: credentials)
  end

  def retrieve_object(params)
    @client.get_object(bucket: params[:bucket], key: params[:key])
  end
end
