require 'spec_helper'

module PageWeight
  describe HTTP do
    it "should raise an argument error when no argument is supplied" do
      expect {HTTP.response_for()}.to raise_error(ArgumentError)
    end

    it "should raise an argument error when too many arguments are supplied" do
      expect {HTTP.response_for("yip", "yap")}.to raise_error(ArgumentError)
    end
    
    it "should raise http error when an invalid argument is supplied" do
      expect {HTTP.response_for(9090)}.to raise_error(NoMethodError)
    end

    it "should return a Net::HTTPResponse when a valid input is supplied" do
      url = "http://localhost:3000"
      parsed_url = URL.builder(url)
      HTTP.response_for(parsed_url).should be_a_kind_of(Net::HTTPResponse)
    end
  end
end