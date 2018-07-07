require 'json'
require 'net/http'
require 'active_support/core_ext/hash'

module Jekyll_Xml_Source
  class Generator < Jekyll::Generator
    safe true
    priority :highest

    def generate(site)
      config = site.config['jekyll_xml']

      if !config
        return
      end

      config.each do |data|
        begin
          result = Net::HTTP.get_response(URI.parse(data['source'])).body
          site.data[data['data']] = JSON.load(Hash.from_xml(result).to_json)
        rescue
          next
        end
      end
    end
  end
end
