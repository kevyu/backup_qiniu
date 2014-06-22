require 'qiniu'

module Backup
  module Storage
    class Qiniu < Base

      attr_accessor :access_key, :access_key_secret, :bucket, :path

      def initialize(model, storage_id = nil, &block)
        super(model, storage_id)

        @bucket ||= 'backups'
        @path ||= ''

        instance_eval(&block) if block_given?
      end

      def transfer!
        remote_path = remote_path_for(package)
        establish_connection!

        package.filenames.each do |filename|
          src = File.join(Config.tmp_path, filename)
          dest = File.join(remote_path, filename)

          Logger.info "#{storage_name} uploading '#{ dest }'..."
          upload_token = Qiniu.generate_upload_token :scope => bucket
          result = Qiniu.upload_file :uptoken => upload_token,
                                     :file => src,
                                     :bucket => bucket,
                                     :key => dest
          raise "#{storage_name} upload #{dest} failed" unless result
        end

      end

      def remove!(package)
        remote_path = remote_path_for(package)
        establish_connection!

        raise "#{storage_name} delete #{remote_path} failed" unless Qiniu.delete(bucket, remote_path)

      end

      def establish_connection!
        raise 'access_key is missing' if access_key.nil?
        raise 'access_key_secret is missing' if access_key_secret.nil?
        Qiniu.establish_connection! :access_key => access_key, :secret_key => access_key_secret
      end

    end

  end

end