require 'json'
require 'net/http'
require 'active_support/core_ext/hash'

module Jekyll_Xml_Source
  class Generator < Jekyll::Generator
    safe true
    priority :highest

    def saveToCache(data_source, name, content)
      path = "#{data_source}/#{name}.json"
      File.open(path,"w") do |file|
        file.write(content)
      end
    end

    def loadFromCache(data_source, name)
      path = "#{data_source}/#{name}.json"
      if not File.exist?(path)
        return
      end
      File.open(path,"r") do |file|
        return JSON.load(file.read())
      end
    end

    def generate(site)
      config = site.config['jekyll_xml']
      data_source = (site.config['data_source'] || '_data')

      if !config
        return
      end

      config.each do |data|
        if data['cache']
          site.data[data['data']] = loadFromCache(data_source, data['data'])
        end

        if site.data[data['data']].nil?
          begin
            result = Net::HTTP.get_response(URI.parse(data['source'])).body
            site.data[data['data']] = JSON.load(Hash.from_xml(result).to_json)
          rescue
            next
          end

          if data['cache']
            saveToCache(data_source, data['data'], Hash.from_xml(result).to_json)
          end
        end

      end

    end

  end
end
