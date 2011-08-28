require 'spec_helper'

module PageWeight
  describe Parser do
     context "for the HTML body" do
      it "should return the body content when a valid url is supplied" do
        url = "http://localhost:3000/"
        parsed_url = URL.builder(url)
        url_response = HTTP.response_for(parsed_url)
        Parser.html_body_content_for(url_response).to_s.downcase.should include "<head>"
      end

      it "should return an argument error when too many arguments are supplie" do
        expect {Parser.html_body_content_for("yip", "yap")}.to raise_error(ArgumentError)
      end

      it "should return an ArgumentError when no url is supplied to the html body content method" do
        expect {Parser.html_body_content_for()}.to raise_error(ArgumentError)
      end

      it "should return an error when an invalid argument is supplied to the html body content method" do
        expect {Parser.html_body_content_for(9090)}.to raise_error(NoMethodError)
      end
    end
  end
end
