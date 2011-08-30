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
end
