require 'spec_helper'

RSpec.describe Volunteermatch::API::SearchOrganizations do
  subject { Volunteermatch::Client.new('acme','1234567890ABCDEF') }

  describe "searchOrganizations api call" do
    it "requires location as an argument" do
      expect { subject.search_organizations }.to raise_error(ArgumentError)
    end

    it "should call #search_organizations with appropriate arguments" do
      expect(subject).to receive(:search_organizations).with({location: "94108", numberOfResults: 10, pageNumber: 3, fieldsToDisplay: ["name", "location"], names: ["red cross"]})
      subject.search_organizations(location: "94108", numberOfResults: 10, pageNumber: 3, fieldsToDisplay: ["name", "location"], names: ["red cross"])
    end

    it "returns a list of organizations requested" do
      url = URI.parse("http://www.volunteermatch.org/api/call?action=searchOrganizations&query=" + URI.encode({ location: "94108", numberOfResults: 10, pageNumber: 3, fieldsToDisplay: ["name", "location"], names: ["red cross"] }.to_json))
      stub = stub_get(url).to_return(status: 200, body: fixture("search_organizations.json"), headers: { content_type: "application/json" })
      response = JSON.parse(stub.response.body)
      expect(response).to have_key("organizations")
      expect(response["organizations"]).to be_an(Array)
    end

    it "returns the correct page number requested" do
      url = URI.parse("http://www.volunteermatch.org/api/call?action=searchOrganizations&query=" + URI.encode({ location: "94108", numberOfResults: 10, pageNumber: 3, fieldsToDisplay: ["name", "location"], names: ["red cross"] }.to_json))
      stub = stub_get(url).to_return(status: 200, body: fixture("search_organizations.json"), headers: { content_type: "application/json" })
      response = JSON.parse(stub.response.body)
      expect(response["currentPage"]).to eq(3)
    end

    it "returns the correct number of results requested" do
      url = URI.parse("http://www.volunteermatch.org/api/call?action=searchOrganizations&query=" + URI.encode({ location: "94108", numberOfResults: 10, pageNumber: 3, fieldsToDisplay: ["name", "location"], names: ["red cross"] }.to_json))
      stub = stub_get(url).to_return(status: 200, body: fixture("search_organizations.json"), headers: { content_type: "application/json" })
      response = JSON.parse(stub.response.body)
      expect(response["resultsSize"]).to eq(2)
    end

    it "returns the correct fields requested" do
      url = URI.parse("http://www.volunteermatch.org/api/call?action=searchOrganizations&query=" + URI.encode({ location: "94108", numberOfResults: 10, pageNumber: 3, fieldsToDisplay: ["name", "location"], names: ["red cross"] }.to_json))
      stub = stub_get(url).to_return(status: 200, body: fixture("search_organizations.json"), headers: { content_type: "application/json" })
      response = JSON.parse(stub.response.body)
      expect(response["organizations"].first).to have_key("name")
      expect(response["organizations"].first).to have_key("location")
    end
  end
end
