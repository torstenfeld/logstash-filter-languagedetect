require "logstash/filters/base"
require "logstash/namespace"
require 'whatlanguage'

# This filter will try to determine the language of the field given
# by the source parameter and output the result in either the language
# name (in English lowercase) or iso format
class LogStash::Filters::Languagedetect < LogStash::Filters::Base

  # Setting the config_name here is required. This is how you
  # configure this filter from your Logstash config.
  #
  # filter {
  #   languagedetect {
  #     source => "message"
  #     target => "lang"
  #     useiso => true
  #   }
  # }
  #
  config_name "languagedetect"
  
  # Set the source field which is used for the language check.
  #
  # Example:
  # [source,ruby]
  #     filter {
  #       languagedetect {
  #         # tries to determine the language in "customfield"
  #         source => "customfield"
  #       }
  #     }
  config :source, :validate => :string, :default => "message"

  # Set the result field in which the result will be stored.
  #
  # Example:
  # [source,ruby]
  #     filter {
  #       languagedetect {
  #         # outputs the result into "customoutput"
  #         target => "customoutput"
  #       }
  #     }
  config :target, :validate => :string, :default => "lang"

  # If useiso is true, result will be "en" instead of "english"
  #
  # Example:
  # [source,ruby]
  #     filter {
  #       languagedetect {
  #         useiso => true
  #       }
  #     }
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
    else
      lang_found = @wl.language(text_to_detect)
    end

    event[@target] = lang_found.to_s.force_encoding(Encoding::UTF_8)

    # filter_matched should go in the last line of our successful code
    filter_matched(event)
  end # def filter
end # class LogStash::Filters::Languagedetect