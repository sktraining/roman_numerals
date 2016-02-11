require_relative '../aws_handler.rb'
require 'aws-sdk'

describe AWSHandler do
  describe '.instance' do
    let(:access_key) { 'some-access-key' }
    let(:secret) { 'some-secret' }
    let(:creds_json) {
      {
        "ACCESS_KEY_ID" => access_key,
        "SECRET_ACCESS_KEY" => secret
      }.to_json
    }
    let(:aws_creds) { double('aws-creds') }

    before do
      allow(File).to receive(:read).with('config/aws.json') { creds_json }
      allow(Aws::Credentials).to receive(:new).with(access_key, secret) { aws_creds }
      allow(Aws.config).to receive(:update)
      described_class.instance
    end

    specify { expect(Aws.config).to have_received(:update).with(region: 'us-east-1', credentials: aws_creds) }
  end

  describe '#read_file' do
    let(:bucket_name) { 'some-bucket' }
    let(:key) { 'some-key' }
    let(:file_contents) { 'file-contents'}
    let(:client) { double('aws-client') }
    let(:aws_object) { double('aws-object', body: body)}
    let(:body) { double('body', read: file_contents)}

    before do
      allow(Aws::S3::Client).to receive(:new) { client }
      allow(client).to receive(:get_object).with(bucket: bucket_name, key: key) { aws_object }
      described_class.new.read_file(bucket_name, key)
    end

    specify { expect(client).to have_received(:get_object).with(bucket: bucket_name, key: key) }
    specify { expect(aws_object).to have_received(:body) }
    specify { expect(body).to have_received(:read) }
  end

  describe '#write_file' do
    let(:bucket_name) { 'some-bucket' }
    let(:bucket) { double('bucket') }
    let(:key) { 'some-key' }
    let(:client) { double('aws-client') }
    let(:aws_object) { double('aws-object')}
    let(:new_file_body) { 'some-body' }

    before do
      allow(Aws::S3::Client).to receive(:new) { client }
      allow(client).to receive(:bucket).with(bucket_name) { bucket }
      allow(bucket).to receive(:object).with(key) { aws_object }
      allow(aws_object).to receive(:put)
      described_class.new.write_file(bucket_name, key, new_file_body)
    end

    specify { expect(aws_object).to have_received(:put).with(body: new_file_body) }
  end
end
