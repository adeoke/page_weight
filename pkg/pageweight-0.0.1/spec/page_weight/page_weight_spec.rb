require 'spec_helper'

module PageWeight
  describe PageWeight do
    context "HTML weight" do
      it "it should raise an argument error when no armuent is supplied" do
        expect {PageWeight.of_html_for()}.to raise_error(ArgumentError)
      end

      it "should raise an argument error when 2 arguments are supplied" do
        expect {PageWeight.of_html_for("yip", "yap")}.to raise_error(ArgumentError)
      end

      it "should raise an error for invalid an invalid url argument" do
        expect {PageWeight.of_html_for(9090)}.to raise_error(URI::InvalidURIError)
      end

      it "should return the html pageweight when a valid url is supplied" do
        url = "http://localhost:3000"
        PageWeight.of_html_for(url).should == 1837
      end
    end
  end
end