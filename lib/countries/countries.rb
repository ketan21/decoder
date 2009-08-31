module Decoder
  class Countries
    attr_accessor :countries
    
    def initialize
      self.load_yaml
    end
    
    def load_yaml
      self.countries = YAML.load_file(yaml_file_name)
    end
    
    def yaml_file_name
      "#{File.dirname(__FILE__)}/../i18n/countries/#{Decoder.i18n}.yml"
    end
    
    def [](_code)
      _code    = _code.to_s.upcase
      country = countries[_code]
      Decoder::Country.new(:code => _code, :name => country)
    end
    
    def self.[](_code)
      self.new[_code]
    end
  end
end