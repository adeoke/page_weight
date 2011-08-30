module PageWeight
  class Parser
    def self.html_body_content_for(input)
      HTTP.response_for(input).body
    end

    def self.images_body_content_for(input)
      images_body = []
      images = images_in(input)
      images_body = body_content_for(images)
      images_body.inject(:+)
    end

    def self.images_in(input)
      files_for_url_with_xpath(input, "//img/@src")
    end

    def self.flash_objects_in(input)
      files_for_url_with_xpath(input, "//embed[contains(@type, 'flash')]/@src")
    end

    def self.css_files_in(input)
      files_for_url_with_xpath(input, "//link[@type='text/css']/@href")
    end

    def self.javascript_files_in(input)
      files_for_url_with_xpath(input, "//script[@type='text/javascript']/@src")
    end

    def self.flash_objects_body_content_for(input)
      flash_body = []
      flash_files = flash_objects_in(input)
      flash_body = body_content_for(flash_files)
      flash_body.inject(:+)
    end

    def self.css_files_body_content_for(input)
      css_body = []
      css_files = css_files_in(input)
      css_body = body_content_for(css_files)
      css_body.inject(:+)
    end

    def self.javascript_content_length_for(input)
      javascript_body = []
      javascript_files = javascript_files_in(input)
      javascript_body = body_content_for(javascript_files)
      javascript_body.inject(:+)
    end

    def self.body_content_for(file_type)
      file_type.collect do |path|
        path.to_s.downcase.start_with?("http://", "https://") ? file_path = path : file_path = "#{PageWeight.url}#{path}"
        HTTP.response_for(URL.builder(file_path)).body
      end
    end

    private

    def self.files_for_url_with_xpath(input, xpath)
      doc = HTMLDocument.creator_for(input)
      doc.xpath(xpath)
    end
  end
end
