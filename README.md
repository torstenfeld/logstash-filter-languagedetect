# Logstash Plugin

This is a plugin for [Logstash](https://github.com/elasticsearch/logstash).

It is fully free and fully open source. The license is Apache 2.0, meaning you are pretty much free to use it however you want in whatever way.

# Status
- [![Gem Version](https://badge.fury.io/rb/logstash-filter-languagedetect.svg)](http://badge.fury.io/rb/logstash-filter-languagedetect)
- [![Build Status](https://travis-ci.org/torstenfeld/logstash-filter-languagedetect.svg?branch=master)](https://travis-ci.org/torstenfeld/logstash-filter-languagedetect) (master)
- [![Coverage Status](https://coveralls.io/repos/torstenfeld/logstash-filter-languagedetect/badge.svg?branch=master)](https://coveralls.io/r/torstenfeld/logstash-filter-languagedetect?branch=master)
- [![Code Climate](https://codeclimate.com/github/torstenfeld/logstash-filter-languagedetect/badges/gpa.svg)](https://codeclimate.com/github/torstenfeld/logstash-filter-languagedetect)
- [![Dependency Status](https://gemnasium.com/torstenfeld/logstash-filter-languagedetect.svg)](https://gemnasium.com/torstenfeld/logstash-filter-languagedetect)

# Installation

- Edit Logstash `Gemfile` and add needed requirements:
```ruby
gem "whatlanguage"
gem "logstash-filter-languagedetect", ">= 0.2.0", :git => "https://github.com/torstenfeld/logstash-filter-languagedetect.git"
```


- Install and update dependencies
```sh
bundle install
```
