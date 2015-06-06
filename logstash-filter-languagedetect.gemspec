Gem::Specification.new do |s|
  s.name = 'logstash-filter-languagedetect'
  s.version = '0.1.2'
  s.version = "#{s.version}.pre.#{ENV['TRAVIS_BUILD_NUMBER']}" if ENV['TRAVIS'] and ENV['TRAVIS_BRANCH'] != 'master'
  s.licenses = ['Apache License (2.0)']
  s.summary = "This example filter replaces the contents of the message field with the specified value."
  s.description = "This gem is a logstash plugin required to be installed on top of the Logstash core pipeline using $LS_HOME/bin/plugin install gemname. This gem is not a stand-alone program"
  s.authors = ["Torsten Feld"]
  s.email = 'logstash@torsten-feld.de'
  s.homepage = "https://github.com/torstenfeld/logstash-filter-languagedetect"
  s.require_paths = ["lib"]

  # Files
  s.files = `git ls-files`.split($\)
  # Tests
  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  # Special flag to let us know this is actually a logstash plugin
  s.metadata = { "logstash_plugin" => "true", "logstash_group" => "filter" }

  # Gem dependencies
  s.add_runtime_dependency "logstash-core", '>= 1.4.0', '< 2.0.0'
  s.add_runtime_dependency "whatlanguage", '~> 1.0.5'
  s.add_development_dependency 'logstash-devutils'
  s.add_development_dependency 'coveralls', '~> 0.8.1'
end
