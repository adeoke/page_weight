require 'spec_helper'

module PageWeight
  describe Reporter do
    context "for HTML body" do
      it "should return the body content length when a valid input is supplied" do
        url = 'http://localhost:3000/'
        parsed_url = URL.builder(url)
        PageWeight.url = parsed_url
        Reporter.body_content_length_for(parsed_url).should == 1837
      end

      it "should return an error if no input is supplied to body_content_length" do
        expect{Reporter.body_content_length_for()}.to raise_error(ArgumentError)
      end

      it "should return an error if too many arguments are supplied to body_content_length" do
        expect{Reporter.body_content_length_for("yip", "yap")}.to raise_error(ArgumentError)
      end

      it "should raise an error if an invalid input is supplied to body_content_length" do
        expect{Reporter.body_content_length_for(9090)}.to raise_error(NoMethodError)
      end
    end

    context "for images" do
      it "should return the images content length when a valid input is supplied" do
        url = 'http://localhost:3000/'
        parsed_url = URL.builder(url)
        PageWeight.url = parsed_url
        Reporter.images_content_length_for(parsed_url).should == 85176
      end

      it "should return an error if no input is supplied to images_content_length" do
        expect{Reporter.images_content_length_for()}.to raise_error(ArgumentError)
      end

      it "should return an error when too many arguments are supplied to images_content_length method" do
        expect{Reporter.images_content_length_for("yip", "yap")}.to raise_error(ArgumentError)
      end

      it "should raise an error if an invalid input is supplied to images_content_length" do
        expect{Reporter.images_content_length_for(9090)}.to raise_error(NoMethodError)
      end

      it "should return the number of images for a valid url" do
        url = 'http://localhost:3000/'
        parsed_url = URL.builder(url)
        Reporter.image_count_for(parsed_url).should == 3
      end

      it "should return an error if no input is supplied to images count method" do
        expect{Reporter.image_count_for()}.to raise_error(ArgumentError)
      end

      it "should return an error when too many arguments are supplied to images count method" do
        expect{Reporter.image_count_for("yip", "yap")}.to raise_error(ArgumentError)
      end

      it "should raise an error if an invalid input is supplied to images count method" do
        expect{Reporter.image_count_for(9090)}.to raise_error(NoMethodError)
      end
    end

    context "for flash" do
      it "should return the flash objects content length when a valid url is supplied with associated flash files" do
        url = 'http://localhost:3000/'
        parsed_url = URL.builder(url)
        PageWeight.url = parsed_url
        Reporter.flash_content_length_for(parsed_url).should == 166688
      end

      it "should return an error if no input is supplied to flash content length" do
        expect{Reporter.flash_content_length_for()}.to raise_error(ArgumentError)
      end

      it "should return an error when too many arguments are supplied to flash content length method" do
        expect{Reporter.flash_content_length_for("yip", "yap")}.to raise_error(ArgumentError)
      end

      it "should raise an error if an invalid input is supplied to flash content length" do
        expect{Reporter.flash_content_length_for(9090)}.to raise_error(NoMethodError)
      end

      it "should return the number of flash objects for a valid url with flash objects" do
        url = 'http://localhost:3000/'
        parsed_url = URL.builder(url)
        Reporter.flash_count_for(parsed_url).should == 2
      end

      it "should return an error if no input is supplied to flash count method" do
        expect{Reporter.flash_count_for()}.to raise_error(ArgumentError)
      end

      it "should return an error when too many arguments are supplied to flash count method" do
        expect{Reporter.flash_count_for("yip", "yap")}.to raise_error(ArgumentError)
      end

      it "should raise an error if an invalid input is supplied to flash count method" do
        expect{Reporter.flash_count_for(9090)}.to raise_error(NoMethodError)
      end
    end

    context "for CSS" do
      it "should return the CSS weight for a valid url" do
        url = 'http://localhost:3000/'
        parsed_url = URL.builder(url)
        PageWeight.url = parsed_url
        Reporter.css_content_length_for(parsed_url).should == 404
      end

      it "should return an error if no input is supplied to CSS content length" do
        expect{Reporter.css_content_length_for()}.to raise_error(ArgumentError)
      end

      it "should return an error when too many arguments are supplied to CSS content length method" do
        expect{Reporter.css_content_length_for("yip", "yap")}.to raise_error(ArgumentError)
      end

      it "should raise an error if an invalid input is supplied to CSS content length" do
        expect{Reporter.css_content_length_for(9090)}.to raise_error(NoMethodError)
      end

      it "should return the number of css files when a valid url which includes CSS files is supplied" do
        url = 'http://localhost:3000/'
        parsed_url = URL.builder(url)
        PageWeight.url = parsed_url
        Reporter.css_count_for(parsed_url).should == 1
      end

      it "should return an error if no input is supplied to CSS count method" do
        expect{Reporter.css_count_for()}.to raise_error(ArgumentError)
      end

      it "should return an error when too many arguments are supplied to CSS count method" do
        expect{Reporter.css_count_for("yip", "yap")}.to raise_error(ArgumentError)
      end

      it "should raise an error if an invalid input is supplied to CSS count method" do
        expect{Reporter.css_count_for(9090)}.to raise_error(NoMethodError)
      end
    end


    context "for javascript" do
      it "should return the javascript content length for a valid url" do
        url = 'http://localhost:3000/'
        parsed_url = URL.builder(url)
        PageWeight.url = parsed_url
        Reporter.javascript_content_length_for(parsed_url).should == 25809
      end

      it "should return an error if no input is supplied to javascript content length" do
        expect{Reporter.javascript_content_length_for()}.to raise_error(ArgumentError)
      end

      it "should return an error when too many arguments are supplied to javascript content length method" do
        expect{Reporter.javascript_content_length_for("yip", "yap")}.to raise_error(ArgumentError)
      end

      it "should raise an error if an invalid input is supplied to javascript content length" do
        expect{Reporter.javascript_content_length_for(9090)}.to raise_error(NoMethodError)
      end

      it "should return the number of javascript files when a valid url which includes javascript files is supplied" do
        url = 'http://localhost:3000/'
        parsed_url = URL.builder(url)
        PageWeight.url = parsed_url
        Reporter.javascript_count_for(parsed_url).should == 1
      end

      it "should return an error if no input is supplied to javascript count method" do
        expect{Reporter.javascript_count_for()}.to raise_error(ArgumentError)
      end

      it "should return an error when too many arguments are supplied to javascript count method" do
        expect{Reporter.javascript_count_for("yip", "yap")}.to raise_error(ArgumentError)
      end

      it "should raise an error if an invalid input is supplied to javascript count method" do
        expect{Reporter.javascript_count_for(9090)}.to raise_error(NoMethodError)
      end
    end

    context "full report" do
      it "should return a hash report" do
        url = 'http://localhost:3000/'
        parsed_url = URL.builder(url)
        PageWeight.url = parsed_url
        Reporter.full_report_for(parsed_url).should be_a_kind_of(Hash)
      end
    end    
  end
end