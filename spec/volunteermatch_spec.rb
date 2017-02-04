require "spec_helper"

RSpec.describe Volunteermatch do
  it "has a version number" do
    expect(Volunteermatch::VERSION).not_to be nil
  end

  subject { Volunteermatch::Client.new(test_user, test_key) }

  describe ".new" do
    it "requires api username and key as arguments" do
      expect { Volunteermatch::Client.new }.to raise_error(ArgumentError)
    end

    it "accepts an api username argument" do
      client = Volunteermatch::Client.new('test_user', 'test_key')
      expect(client.api_username).to eq('test_user')
    end

    it "accepts an api key argument" do
      client = Volunteermatch::Client.new('test_user', 'test_key')
      expect(client.api_key).to eq('test_key')
    end
  end
end
