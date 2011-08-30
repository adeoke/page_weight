module PageWeight
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
