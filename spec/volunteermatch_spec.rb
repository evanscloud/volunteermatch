require "spec_helper"

RSpec.describe Volunteermatch do
  describe ".new" do
    it "requires api username and key as arguments" do
      expect { Volunteermatch::Client.new }.to raise_error(ArgumentError)
    end
  end
end
