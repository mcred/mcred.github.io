require 'json'
require 'hash-joiner'
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
      if !config.kind_of?(Array)
        config = [config]
      end
      config.each do |d|
        begin
          s = Net::HTTP.get_response(URI.parse(d['source'])).body
          site.data[d['data']] = JSON.load(Hash.from_xml(s).to_json)
        rescue
          next
        end

      end
    end
  end
end
