require 'uri'
require 'net/http'
require 'nokogiri'

module PageWeight
  class PageWeight
    attr_accessor :base_url
    def self.report_for(input)
      @base_url = URL.builder(input)
      Reporter.full_report_for(@base_url)
    end

    def self.of_html_for(input)
      @base_url = URL.builder(input)
      Reporter.body_content_length_for(@base_url)
    end

    def self.of_images_for(input)
      @base_url = URL.builder(input)
      Reporter.images_content_length_for(@base_url)
    end

    def self.number_of_images_for(input)
      @base_url = URL.builder(input)
      Reporter.image_count_for(@base_url)
    end

    def self.number_of_flash_objects_for(input)
      @base_url = URL.builder(input)
      Reporter.flash_count_for(@base_url)
    end

    def self.of_flash_for(input)
      @base_url = URL.builder(input)
      Reporter.flash_content_length_for(@base_url)
    end

    def self.of_css_for(input)
      @base_url = URL.builder(input)
      Reporter.css_content_length_for(@base_url)
    end

    def self.css_files_count_for(input)
      @base_url = URL.builder(input)
      Reporter.css_count_for(@base_url)
    end

    def self.of_javascript_for(input)
      @base_url = URL.builder(input)
      Reporter.javascript_content_length_for(@base_url)
    end

    def self.javascript_files_count_for(input)
      @base_url = URL.builder(input)
      Reporter.javascript_count_for(@base_url)
    end

    def self.url
      @base_url
    end
    
    private

    def self.url=(input)
      @base_url = input
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

  class HTMLDocument
    def self.creator_for(input)
      html_body = Parser.html_body_content_for(input)
      Nokogiri::HTML(html_body)
    end
  end

  class Reporter
    def self.body_content_length_for(input)
      full_report_for(input)[:html]
    end

    def self.images_content_length_for(input)
      full_report_for(input)[:images]
    end

    def self.image_count_for(input)
      full_report_for(input)[:number_of_images_files]
    end

    def self.flash_content_length_for(input)
      full_report_for(input)[:flash]
    end

    def self.flash_count_for(input)
      full_report_for(input)[:number_of_flash_files]
    end

    def self.css_content_length_for(input)
      full_report_for(input)[:css]
    end

    def self.css_count_for(input)
      full_report_for(input)[:number_of_css_files]
    end

    def self.javascript_content_length_for(input)
      full_report_for(input)[:javascript]
    end

    def self.javascript_count_for(input)
      full_report_for(input)[:number_of_javascript_files]
    end

    def self.full_report_for(input)
      result = {}
      result[:html] = Parser.html_body_content_for(input).size
      result[:css] = Parser.css_files_body_content_for(input).size
      result[:number_of_css_files] = Parser.css_files_in(input).size
      result[:javascript] = Parser.javascript_content_length_for(input).size
      result[:number_of_javascript_files] = Parser.javascript_files_in(input).size
      result[:images] = Parser.images_body_content_for(input).size
      result[:number_of_images_files] = Parser.images_in(input).size
      result[:flash] = Parser.flash_objects_body_content_for(input).size
      result[:number_of_flash_files] = Parser.flash_objects_in(input).size
      result[:total_weight] = result.values.compact.inject(:+)
      result
    end
  end
end