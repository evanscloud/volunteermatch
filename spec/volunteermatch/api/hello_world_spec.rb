require 'spec_helper'

RSpec.describe Volunteermatch::API::HelloWorld do
  subject { Volunteermatch::Client.new('VolunteerMatch','test_key') }

  describe "helloWorld api call" do
    it "returns the correct name" do
      url = URI.parse("http://www.volunteermatch.org/api/call?action=helloWorld&query=" + URI.encode({name: "VolunteerMatch"}.to_json))
      stub = stub_get(url).to_return(status: 200, body: fixture("hello_world.json"), headers: { content_type: "application/json" })
      response = JSON.parse(stub.response.body)
      expect(response["name"]).to eq("VolunteerMatch")
    end

    it "returns Hello VolunteerMatch!" do
      url = URI.parse("http://www.volunteermatch.org/api/call?action=helloWorld&query=" + URI.encode({name: "VolunteerMatch"}.to_json))
      stub = stub_get(url).to_return(status: 200, body: fixture("hello_world.json"), headers: { content_type: "application/json" })
      response = JSON.parse(stub.response.body)
      expect(response["result"]).to eq("Hello VolunteerMatch!")
    end
  end
end
