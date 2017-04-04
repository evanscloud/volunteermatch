require 'spec_helper'

RSpec.describe Volunteermatch::API::ServiceStatus do
  subject { Volunteermatch::Client.new('acme','1234567890ABCDEF') }

  before(:each) do
    @url = "http://www.volunteermatch.org/api/call?action=getServiceStatus"
    @stub = stub_get(@url).to_return(status: 200, body: fixture("service_status.json"), headers: { content_type: "application/json" })
    @response = JSON.parse(@stub.response.body)
  end

  describe "getServiceStatus api call" do
    it "returns number of public members" do
      expect(@response).to have_key("publicMembers")
      expect(@response["publicMembers"]).to be_an(Integer)
    end

    it "returns number of public opportunities" do
      expect(@response).to have_key("publicOpportunities")
      expect(@response["publicOpportunities"]).to be_an(Integer)
    end

    it "returns number of public organizations" do
      expect(@response).to have_key("publicOrganizations")
      expect(@response["publicOrganizations"]).to be_an(Integer)
    end

    it "returns number of public organizations with opportunities" do
      expect(@response).to have_key("publicOrganizationsWithOpportunities")
      expect(@response["publicOrganizationsWithOpportunities"]).to be_an(Integer)
    end

    it "returns number of public referrals" do
      expect(@response).to have_key("publicReferrals")
      expect(@response["publicReferrals"]).to be_an(Integer)
    end
  end
end
