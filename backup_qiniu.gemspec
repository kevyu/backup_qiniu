# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "backup_qiniu"
  spec.version       = "0.1.1"
  spec.authors       = ["Haibin Yu"]
  spec.email         = ["seashineyu@gmail.com"]
  spec.description   = %q{Backup storage for supporting Qiniu cloud}
  spec.summary       = %q{backup storage for qiniu}
  spec.homepage      = "https://github.com/kevyu/backup_qiniu"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "backup", ">= 5.0.0.beta.1"
  spec.add_dependency "qiniu", ">= 6.9.0"

end
