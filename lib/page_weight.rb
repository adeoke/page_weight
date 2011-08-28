require 'uri'
require 'net/http'
require 'nokogiri'

module PageWeight
  class PageWeight
    def self.of_html_for(input)
      parsed_url = URL.builder(input)
      url_response = HTTP.response_for(parsed_url)
      Parser.html_body_content_for(url_response)
    end
  end

  class URL
    def self.builder(input)
      url_input = parse(input)
      url = ""
			url << url_input.scheme if !url_input.scheme.nil?
			url << "://"
      url << url_input.userinfo if !url_input.userinfo.nil?
			url << url_input.host if !url_input.host.nil?
			url << ":" << url_input.port.to_s if !url_input.port.nil?
			url << url_input.path if !url_input.path.nil?
      url << "?#{url_input.query}" if !url_input.query.nil?
			url << "/" if !url.strip.end_with?("/") && url_input.path.size <= 1
      parse(url)
    end

    private

    def self.parse(input)
      URI.parse(input)
    end
  end

  class HTTP
    def self.response_for(input)
      Net::HTTP.get_response(input)
    end
  end

  class Parser
    def self.html_body_content_for(input)
      input.body
    end
  end

  class Reporter
    
  end
end