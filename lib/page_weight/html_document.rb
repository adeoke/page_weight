module PageWeight
  class HTMLDocument
    def self.creator_for(input)
      html_body = Parser.html_body_content_for(input)
      Nokogiri::HTML(html_body)
    end
  end
end
