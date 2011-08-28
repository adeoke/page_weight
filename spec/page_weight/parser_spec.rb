require 'spec_helper'

module PageWeight
  describe Parser do
    context "for the HTML body" do
      it "should return the body content when a valid url is supplied" do
        url = "http://localhost:3000/"
        parsed_url = URL.builder(url)
        Parser.html_body_content_for(parsed_url).to_s.downcase.should include "<head>"
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

    context "for images" do
      it "should return the images body content when a valid url is supplied" do
        url = "http://localhost:3000/"
        parsed_url = URL.builder(url)
        PageWeight.url = parsed_url
        Parser.images_body_content_for(parsed_url).should_not be_nil
      end

      it "should return an error when too many arguments are supplied to the body content method" do
        expect {Parser.images_body_content_for("yip", "yap")}.to raise_error(ArgumentError)
      end

      it "should return an error when no url is supplied to the images body content method" do
        expect {Parser.images_body_content_for()}.to raise_error(ArgumentError)
      end

      it "should return an error when an invalid argument is supplied to the images body contet method" do
        expect {Parser.images_body_content_for(9090)}.to raise_error(NoMethodError)
      end

      it "should return an array of images" do
        url = "http://localhost:3000/"
        parsed_url = URL.builder(url)
        Parser.images_in(parsed_url).should be_a_kind_of(Nokogiri::XML::NodeSet)
      end

      it "should return an error when too many arguments are supplied to the images count method" do
        expect {Parser.images_in("yip", "yap")}.to raise_error(ArgumentError)
      end

      it "should return an error when no url is supplied to the images body content method" do
        expect {Parser.images_in()}.to raise_error(ArgumentError)
      end

      it "should return an error when an invalid argument is supplied to the images body content method" do
        expect {Parser.images_in(9090)}.to raise_error(NoMethodError)
      end
    end

    context "for flash" do
      it "should return an array of flash objects" do
        url = "http://localhost:3000/"
        parsed_url = URL.builder(url)
        Parser.flash_objects_in(parsed_url).should be_a_kind_of(Nokogiri::XML::NodeSet)
      end

      it "should return an error when too many arguments are supplied to the flash count method" do
        expect {Parser.flash_objects_in("yip", "yap")}.to raise_error(ArgumentError)
      end

      it "should return an error when no url is supplied to the flash count method" do
        expect {Parser.flash_objects_in()}.to raise_error(ArgumentError)
      end

      it "should return an error when an invalid argument is supplied to the flash count method" do
        expect {Parser.flash_objects_in(9090)}.to raise_error(NoMethodError)
      end

      it "should return the flash objects body content when a valid url containing with flash files is supplied" do
        url = "http://localhost:3000/"
        parsed_url = URL.builder(url)
        Parser.flash_objects_body_content_for(parsed_url).should_not be_nil
      end

      it "should return an error when too many arguments are supplied to the flash objects body content method" do
        expect {Parser.flash_objects_body_content_for("yip", "yap")}.to raise_error(ArgumentError)
      end

      it "should return an error when no url is supplied to the flash objects body content method" do
        expect {Parser.flash_objects_body_content_for()}.to raise_error(ArgumentError)
      end

      it "should return an error when an invalid argument is supplied to the flash objects body content method" do
        expect {Parser.flash_objects_body_content_for(9090)}.to raise_error(NoMethodError)
      end
    end

    context "for CSS" do
      it "should return the css body content when a valid url is supplied" do
        url = "http://localhost:3000/"
        parsed_url = URL.builder(url)
        Parser.css_files_body_content_for(parsed_url).should_not be_nil
      end

      it "should return an error when no argument is supplied to the CSS body content method" do
        expect {Parser.css_files_body_content_for()}.to raise_error(ArgumentError)
      end

      it "should return an error when an invalid argument is supplied to the CSS body content method" do
        expect {Parser.css_files_body_content_for(9090)}.to raise_error(NoMethodError)
      end

      it "should return an error when too many arguments are supplied to the CSS body content method" do
        expect {Parser.css_files_body_content_for("yip", "yap")}.to raise_error(ArgumentError)
      end

      it "should return an array of css files when a valid url that references css files is supplied" do
        url = "http://localhost:3000/"
        parsed_url = URL.builder(url)
        Parser.css_files_in(parsed_url).should be_a_kind_of(Nokogiri::XML::NodeSet)
      end

      it "should return an error when no argument is supplied to the CSS method" do
        expect {Parser.css_files_in()}.to raise_error(ArgumentError)
      end

      it "should return an error when an invalid argument is supplied to the CSS method" do
        expect {Parser.css_files_in(9090)}.to raise_error(NoMethodError)
      end

      it "should return an error when too many arguments are supplied to the CSS count method" do
        expect {Parser.css_files_in("yip", "yap")}.to raise_error(ArgumentError)
      end
    end

    context "for javascript" do
      it "should return the javascript content length when a valid url is supplied" do
        url = "http://localhost:3000/"
        parsed_url = URL.builder(url)
        Parser.javascript_content_length_for(parsed_url).should_not be_nil
      end

      it "should return an error when no argument is supplied to the javasscript body content method" do
        expect {Parser.javascript_content_length_for()}.to raise_error(ArgumentError)
      end

      it "should return an error when an invalid argument is supplied to the javasscript body content method" do
        expect {Parser.javascript_content_length_for(9090)}.to raise_error(NoMethodError)
      end

      it "should return an error when too many arguments are supplied to the javasscript body content method" do
        expect {Parser.javascript_content_length_for("yip", "yap")}.to raise_error(ArgumentError)
      end

      it "should return an array of javascript files when a valid url that references javascript files is supplied" do
        url = "http://localhost:3000/"
        parsed_url = URL.builder(url)
        Parser.javascript_files_in(parsed_url).should be_a_kind_of(Nokogiri::XML::NodeSet)
      end

      it "should return an error when no argument is supplied to the javascript count method" do
        expect {Parser.javascript_files_in()}.to raise_error(ArgumentError)
      end

      it "should return an error when an invalid argument is supplied to the javascript count method" do
        expect {Parser.javascript_files_in(9090)}.to raise_error(NoMethodError)
      end

      it "should return an error when too many arguments are supplied to the javascript count method" do
        expect {Parser.javascript_files_in("yip", "yap")}.to raise_error(ArgumentError)
      end
    end
  end
end
