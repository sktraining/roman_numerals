require_relative '../../lib/aws_client.rb'

describe AwsClient do

  let(:credentials) { double(:aws_credentials_object) }
  let(:client) { double(:aws_client) }

  before do
    allow(Aws::Credentials).to receive(:new).with('fooey access key',
                                                  'barey secret') { credentials }
    allow(Aws::S3::Client).to receive(:new).with(region: 'mars',
                                                 credentials: credentials) { client }
  end

  subject do
    described_class.new({
      access_key_id: 'fooey access key',
      secret_access_key: 'barey secret',
      region: 'mars'
    })
  end

  describe '#retrieve_object' do
    before do
      allow(client).to receive(:get_object)
    end

    it 'calls aws' do
      subject.retrieve_object({
        bucket: 'bucket_name',
        key: 'file_path'
      })
      expect(client).to have_received(:get_object).with(bucket: 'bucket_name', key: 'file_path')
    end
  end

  describe '#put_object' do
    before do
      allow(client).to receive(:put_object)
    end

    it do
      subject.put_object({
        bucket: 'bucket_name',
        key: 'file_path',
        body: 'my_great_file'
      })
      expect(client).to have_received(:put_object).with(bucket: 'bucket_name', key: 'file_path', body: 'my_great_file')
    end
  end
end
