require 'bundler/setup'
require 'volunteermatch'
require 'webmock/rspec'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

WebMock.disable_net_connect!(allow_localhost: true)

def a_get(path)
  a_request(:get, path)
end

def stub_get(path)
  stub_request(:get, path)
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end
