# encoding: utf-8
require "logstash/filters/base"
require "logstash/namespace"
require 'whatlanguage'
# require 'whatlanguage/string'

# This example filter will replace the contents of the default 
# message field with whatever you specify in the configuration.
#
# It is only intended to be used as an example.
class LogStash::Filters::Languagedetect < LogStash::Filters::Base

  # Setting the config_name here is required. This is how you
  # configure this filter from your Logstash config.
  #
  # filter {
  #   example {
  #     message => "My message..."
  #   }
  # }
  #
  config_name "languagedetect"
  
  # Replace the message with this value.
  config :source, :validate => :string, :default => "message"

  config :target, :validate => :string, :default => "lang"

  config :useiso, :validate => :boolean, :default => false


  public
  def register
    @wl = WhatLanguage.new(:all)
  end # def register

  public
  def filter(event)

    text_to_detect = event[@source]
    if @useiso
      lang_found = @wl.language_iso(text_to_detect)
      # lang_found = text_to_detect.language_iso
    else
      lang_found = @wl.language(text_to_detect)
      # lang_found = text_to_detect.language
    end

    event[@target] = lang_found

    # filter_matched should go in the last line of our successful code
    filter_matched(event)
  end # def filter
end # class LogStash::Filters::Languagedetect