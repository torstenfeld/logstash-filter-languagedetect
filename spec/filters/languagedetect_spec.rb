require 'spec_helper'
require "lib/logstash/filters/languagedetect"

describe LogStash::Filters::Languagedetect do
  describe "Set to Hello World" do
    let(:config) do <<-CONFIG
      filter {
        languagedetect {
          message => "Hello World"
        }
      }
    CONFIG
    end

    sample("message" => "some text") do
      expect(subject).to include("message")
      expect(subject['message']).to eq('Hello World')
    end
  end
end
