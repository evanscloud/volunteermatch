require 'spec_helper'

RSpec.describe Volunteermatch::API::HelloWorld do
  subject { Volunteermatch::Client.new('acme','1234567890ABCDEF') }

  describe "helloWorld api call" do
    it "should call #test with appropriate arguments" do
      expect(subject).to receive(:test).with("John")
      subject.test("John")
    end

    it "returns the correct name" do
      url = URI.parse("http://www.volunteermatch.org/api/call?action=helloWorld&query=" + URI.encode({name: "John"}.to_json))
      stub = stub_get(url).to_return(status: 200, body: fixture("hello_world.json"), headers: { content_type: "application/json" })
      response = JSON.parse(stub.response.body)
      expect(response["name"]).to eq("John")
    end

    it "returns Hello John!" do
      url = URI.parse("http://www.volunteermatch.org/api/call?action=helloWorld&query=" + URI.encode({name: "John"}.to_json))
      stub = stub_get(url).to_return(status: 200, body: fixture("hello_world.json"), headers: { content_type: "application/json" })
      response = JSON.parse(stub.response.body)
      expect(response["result"]).to eq("Hello John!")
    end
  end
end
