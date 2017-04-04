require 'spec_helper'

RSpec.describe Volunteermatch::API::SearchOpportunities do
  subject { Volunteermatch::Client.new('acme','1234567890ABCDEF') }

  before(:each) do
    @url = URI.parse("http://www.volunteermatch.org/api/call?action=searchOpportunities&query=" + URI.encode({ location: "new york", fieldsToDisplay: ["title", "parentOrg", "plaintextDescription", "location"], numberOfResults: 2, categoryIds: [23] }.to_json))
    @stub = stub_get(@url).to_return(status: 200, body: fixture("search_opportunities.json"), headers: { content_type: "application/json" })
    @response = JSON.parse(@stub.response.body)
  end

  describe "searchOpportunities api call" do
    it "requires location as an argument" do
      expect { subject.search_opportunities }.to raise_error(ArgumentError)
    end

    it "should call #search_opportunities with appropriate arguments" do
      expect(subject).to receive(:search_opportunities).with({ location: "new york", fieldsToDisplay: ["title", "parentOrg", "plaintextDescription", "location"], numberOfResults: 2, categoryIds: [23] })
      subject.search_opportunities(location: "new york", fieldsToDisplay: ["title", "parentOrg", "plaintextDescription", "location"], numberOfResults: 2, categoryIds: [23])
    end

    it "returns a list of opportunities based on category requested" do
      first_opportunity = @response["opportunities"].first
      expect(@response).to have_key("opportunities")
      expect(@response["opportunities"]).to be_an(Array)
      expect(first_opportunity["categoryIds"]).to include(23)
    end

    it "returns the correct number of results requested" do
      expect(@response["resultsSize"]).to eq(2)
    end

    it "returns the correct fields requested" do
      expect(@response["opportunities"].first).to have_key("title")
      expect(@response["opportunities"].first).to have_key("parentOrg")
      expect(@response["opportunities"].first).to have_key("plaintextDescription")
      expect(@response["opportunities"].first).to have_key("location")
    end
  end
end
