require 'spec_helper'

RSpec.describe Volunteermatch::Client do
  before(:each) do
    @client = Volunteermatch::Client.new('acme', '1234567890ABCDEF')
  end

  describe ".new" do
    it "requires api username and key as arguments" do
      expect { Volunteermatch::Client.new }.to raise_error(ArgumentError)
    end

    it "accepts an api username argument" do
      expect(@client.api_username).to eq('acme')
    end

    it "accepts an api key argument" do
      expect(@client.api_key).to eq('1234567890ABCDEF')
    end
  end
end
