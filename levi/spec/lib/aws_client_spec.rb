require_relative '../../lib/aws_client.rb'

describe AwsClient do
  describe '#retrieve_object' do

    let(:credentials) { double(:aws_credentials_object) }
    let(:client) { double(:aws_client, get_object: nil) }

    before do
      allow(Aws::Credentials).to receive(:new).with('fooey access key',
                                                    'barey secret') { credentials }
      allow(Aws::S3::Client).to receive(:new).with(region: 'mars',
                                                   credentials: credentials) { client }
    end

    it 'calls aws' do
      described_class.new({
        access_key_id: 'fooey access key',
        secret_access_key: 'barey secret',
        region: 'mars'
      }).retrieve_object({
        bucket: 'bucket_name',
        key: 'file_path'
      })
      expect(client).to have_received(:get_object).with(bucket: 'bucket_name', key: 'file_path')
    end
  end
end
