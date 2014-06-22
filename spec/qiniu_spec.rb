require File.expand_path('../spec_helper.rb', __FILE__)

describe Backup::Storage::Qiniu do

  let(:model) { Backup::Model.new(:test_trigger, 'test backup') }
  let(:storage) do
    Backup::Storage::Qiniu.new(model) do |db|
      db.access_key = 'my_access_key'
      db.access_key_secret = 'my_access_key_secret'
      db.bucket = 'test_bucket'
      db.path = 'test_backup'
      db.keep = 10
    end
  end

  describe '#initialize' do

    it 'should be a subclass of Storage::Base' do
      Backup::Storage::Qiniu.superclass.should == Backup::Storage::Base
    end

    it 'should init with config' do
      expect(storage.access_key).to eq('my_access_key')
      expect(storage.access_key_secret).to eq('my_access_key_secret')
      expect(storage.bucket).to eq('test_bucket')
      expect(storage.path).to eq('test_backup')
      expect(storage.keep).to eq(10)
    end

    it 'should use default config value if not given' do
      storage = Backup::Storage::Qiniu.new(model)

      expect(storage.access_key).to be_nil
      expect(storage.access_key_secret).to be_nil
      expect(storage.bucket).to eq('backups')
      expect(storage.path).to eq('')
      expect(storage.storage_id).to be_nil
      expect(storage.keep).to be_nil

    end

  end
end