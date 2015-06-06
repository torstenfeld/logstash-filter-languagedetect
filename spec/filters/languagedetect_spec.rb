# encoding: utf-8
require File.absolute_path(File.join(File.dirname(__FILE__), '../../spec/spec_helper'))
require File.absolute_path(File.join(File.dirname(__FILE__), '../../lib/logstash/filters/languagedetect'))

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
      expect(subject['lang']).to eq("english")
    end

    sample("message" => "dies ist ein deutscher Text") do
      expect(subject).to include('lang')
      expect(subject['lang']).to eq("german")
    end

    sample("message" => "Deux autres personnes ont été arrêtées durant la nuit") do
      expect(subject).to include('lang')
      expect(subject['lang']).to eq("french")
    end

    sample("message" => "En estado de máxima alertaen su nivel de crítico") do
      expect(subject).to include('lang')
      expect(subject['lang']).to eq("spanish")
    end
  end

  describe "with iso languages" do
    let(:config) do <<-CONFIG
      filter {
        languagedetect {
          useiso => true
        }
      }
    CONFIG
    end

    sample("message" => "The links between the attempted car bombings in Glasgow and London are becoming clearer") do
      expect(subject).to include('lang')
      expect(subject['lang']).to eq("en")
    end

    sample("message" => "dies ist ein deutscher Text") do
      expect(subject).to include('lang')
      expect(subject['lang']).to eq("de")
    end

    sample("message" => "Deux autres personnes ont été arrêtées durant la nuit") do
      expect(subject).to include('lang')
      expect(subject['lang']).to eq("fr")
    end

    sample("message" => "En estado de máxima alertaen su nivel de crítico") do
      expect(subject).to include('lang')
      expect(subject['lang']).to eq("es")
    end
  end

  describe "non default target" do
    let(:config) do <<-CONFIG
      filter {
        languagedetect {
          useiso => true
          target => 'test'
        }
      }
    CONFIG
    end

    sample("message" => "The links between the attempted car bombings in Glasgow and London are becoming clearer") do
      expect(subject).to include('test')
      expect(subject['test']).to eq("en")
    end
  end

  describe "non default source" do
    let(:config) do <<-CONFIG
      filter {
        languagedetect {
          useiso => true
          source => 'test'
        }
      }
    CONFIG
    end

    sample("test" => "The links between the attempted car bombings in Glasgow and London are becoming clearer") do
      expect(subject).to include('lang')
      expect(subject['lang']).to eq("en")
    end
  end
end
