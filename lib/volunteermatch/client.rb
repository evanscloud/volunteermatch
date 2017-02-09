require 'base64'
require 'digest/sha2'
require 'net/http'
require 'uri'
require 'json'
require 'ostruct'

require 'volunteermatch/api/hello_world'
require 'volunteermatch/api/key_status'
require 'volunteermatch/api/metadata'
require 'volunteermatch/api/service_status'
require 'volunteermatch/api/search_organizations'
require 'volunteermatch/api/search_opportunities'

module Volunteermatch
  class Client
    attr_accessor :api_username, :api_key

    include Volunteermatch::API::HelloWorld
    include Volunteermatch::API::KeyStatus
    include Volunteermatch::API::Metadata
    include Volunteermatch::API::ServiceStatus
    include Volunteermatch::API::SearchOrganizations
    include Volunteermatch::API::SearchOpportunities

    def initialize(api_username, api_key)
      raise ArgumentError, 'username and key need to be defined' if api_username.nil? || api_username.empty? || api_key.nil? || api_key.empty?
      @api_username   = api_username
      @api_key        = api_key
    end

    protected

    def call(action, json_query)
      nonce           = Digest::SHA2.hexdigest(rand.to_s)[0, 20]
      creation_time   = Time.now.utc.strftime("%Y-%m-%dT%H:%M:%S%z")
      password_digest = Base64.encode64(Digest::SHA2.digest(nonce + creation_time + @api_key)).chomp
      url             = URI.parse("http://www.volunteermatch.org/api/call?action=#{action.to_s}&query=" + URI.encode(json_query))

      req             = Net::HTTP::Get.new(url.request_uri)

      req.add_field('Content-Type', 'application/json')
      req.add_field('Authorization', 'WSSE profile="UsernameToken"')
      req.add_field('X-WSSE', 'UsernameToken Username="' + @api_username + '", PasswordDigest="' + password_digest + '", ' +
          'Nonce="' + nonce + '", Created="' + creation_time + '"')

      res             = Net::HTTP.new(url.host, url.port).start { |http| http.request(req) }
      raise "HTTP error code #{res.code}" unless res.code == "200"
      OpenStruct.new(JSON.parse res.body)
    end
  end
end
