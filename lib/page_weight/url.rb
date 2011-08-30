module PageWeight
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

    def self.parse(input)
      URI.parse(input)
    end
  end
end
