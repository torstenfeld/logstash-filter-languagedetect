# encoding: utf-8
require "logstash/filters/base"
require "logstash/namespace"
require 'whatlanguage'

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
  config :source, :validate => :string, :default => "message", :required => true

  config :target, :validate => :string, :default => "lang", :required => true

  config :useiso, :validate => :boolean, :default => false


  public
  def register
    # Add instance variables
  end # def register

  public
  def filter(event)

    text_to_detect = event[@source]
    if @useiso
      lang_found = text_to_detect.language
    else
      lang_found = text_to_detect.language
    end

    event[@target] = lang_found

    # filter_matched should go in the last line of our successful code
    filter_matched(event)
  end # def filter
end # class LogStash::Filters::Languagedetect