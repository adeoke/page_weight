require 'spec_helper'

module PageWeight
  describe URL do
    context "URL Builder" do
      it "should raise an argument error when no argument is supplied" do
        expect {URL.builder()}.to raise_error(ArgumentError)
      end

      it "should raise an argument error too many arguments are supplied" do
        expect {URL.builder("yip", "yap")}.to raise_error(ArgumentError)
      end

      it "should be a kind of uri" do
        url = "http://localhost:3000/"
        URL.builder(url).should be_a_kind_of(URI)
      end

      it "should add a forward slash to the end of the url" do
        url = "http://localhost:3000"
        url_ending_with_forward_slash = url << "/"
        URL.builder(url).to_s.should == url_ending_with_forward_slash
      end

      it "should throw an InvalidUri error for url 9090" do
        expect {URL.builder(9090)}.to raise_error(URI::InvalidURIError)
      end
    end
  end
end