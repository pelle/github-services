require File.join(File.dirname(__FILE__), *%w[spec_helper])
require 'net/http'
require 'json'

describe "TimeCert GitHub service" do
  before(:each) do
    @payload=load_fixture :commits
  end
  it "should have correct fixtures" do
    @payload["commits"].size.should==3
  end
  it "should POST the incoming payload to the specified URI" do
    @http=mock("http")
    Net::HTTP.expects(:start).with("timecert.org").yields(@http)
    @http.expects(:get).times(3)
    
    invoke_service(:timecert, {}, @payload)
  end
  
end
