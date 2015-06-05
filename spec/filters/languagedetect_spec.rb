# encoding: utf-8
require File.absolute_path(File.join(File.dirname(__FILE__), '../../spec/spec_helper'))
require File.absolute_path(File.join(File.dirname(__FILE__), '../../lib/logstash/filters/languagedetect'))
# require "lib/logstash/filters/languagedetect"

describe LogStash::Filters::Languagedetect do
  describe "with defaults and non iso languages" do
    let(:config) do <<-CONFIG
      filter {
        languagedetect {}
      }
    CONFIG
    end

    sample("message" => "The links between the attempted car bombings in Glasgow and London are becoming clearer") do
      expect(subject).to include('lang')
      expect(subject['lang']).to eq(:english)
    end

    sample("message" => "dies ist ein deutscher Text") do
      expect(subject).to include('lang')
      expect(subject['lang']).to eq(:german)
    end

    sample("message" => "Deux autres personnes ont été arrêtées durant la nuit") do
      expect(subject).to include('lang')
      expect(subject['lang']).to eq(:french)
    end

    sample("message" => "En estado de máxima alertaen su nivel de crítico") do
      expect(subject).to include('lang')
      expect(subject['lang']).to eq(:spanish)
    end
  end
end
