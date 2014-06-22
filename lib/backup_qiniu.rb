require 'backup'

Backup::Storage.autoload(:Qiniu, File.join(File.dirname(__FILE__), 'backup/storage/qiniu'))