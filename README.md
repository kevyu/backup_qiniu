# Backup to Qiniu

此 Gem 是 [Backup](https://github.com/meskyanichi/backup) 的辅助插件，目的是让 Backup 支持存储到 [Qiniu 云存储](http://qiniu.com)。

## Installation

Add this line to your application's Gemfile:

    gem 'backup_qiniu'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install backup_qiniu

## Usage

你需要在你的 Backup models 文件里面单独引用 `backup_qiniu`，比如：

~/Backup/models/foo.rb

```ruby
require "backup_qiniu" # 引用 backup_qiniu

Backup::Model.new(:foo, 'Description for foo') do

  # 配置 Qiniu 作为备份存储方式
  store_with "Qiniu" do |qiniu|
    qiniu.access_key = 'my_access_id'
    qiniu.access_key_secret = 'my_access_key'
    qiniu.bucket = 'bucket-name'
    qiniu.path = '/path/to/my/backups'
    qiniu.keep = 10
  end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
