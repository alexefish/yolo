require 'spec_helper'
require 'yolo'

describe Yolo::Tasks::Ios::Calabash do
  before do
    @calabash = Yolo::Tasks::Ios::Calabash.new
  end

  describe "when created" do
    it "should set junit as the default format" do
      @calabash.format.should eq(:junit)
    end

    it "should set the iphonesimulator as the default sdk" do
      @calabash.sdk.should eq("iphonesimulator")
    end

    it "should set iphone as the default device" do
      @calabash.device.should eq("iphone")
    end

    it "should set test-reports/calabash as the default output directory" do
      @calabash.output_dir.should eq("test-reports/calabash")
    end

    it "should use the scheme if it is set" do
      scheme = "TEST_SCHEME"
      @calabash.scheme = scheme
      @calabash.scheme.should eq(scheme)
    end

    it "should use the scheme env var if no scheme is set" do
      scheme = "TEST_SCHEME"
      ENV['YOLO_CALABASH_SCHEME'] = scheme
      
      @calabash.scheme.should eq(scheme)
    end
  end
end
