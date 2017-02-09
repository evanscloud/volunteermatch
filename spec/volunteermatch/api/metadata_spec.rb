require 'spec_helper'

RSpec.describe Volunteermatch::API::Metadata do
  subject { Volunteermatch::Client.new('acme','1234567890ABCDEF') }

  describe "getMetaData api call" do
    it "returns a list of categories" do
      url = "http://www.volunteermatch.org/api/call?action=getMetadata"
      stub = stub_get(url).to_return(status: 200, body: fixture("metadata.json"), headers: { content_type: "application/json" })
      response = JSON.parse(stub.response.body)
      expect(response).to have_key("categories")
      expect(response["categories"]).to be_an(Array)
    end

    it "returns a list of partners" do
      url = "http://www.volunteermatch.org/api/call?action=getMetadata"
      stub = stub_get(url).to_return(status: 200, body: fixture("metadata.json"), headers: { content_type: "application/json" })
      response = JSON.parse(stub.response.body)
      expect(response).to have_key("partners")
      expect(response["partners"]).to be_an(Array)
    end

    it "returns a list of US federal corporations" do
      url = "http://www.volunteermatch.org/api/call?action=getMetadata"
      stub = stub_get(url).to_return(status: 200, body: fixture("metadata.json"), headers: { content_type: "application/json" })
      response = JSON.parse(stub.response.body)
      expect(response).to have_key("usCorps")
      expect(response["usCorps"]).to be_an(Array)
    end
  end
end
