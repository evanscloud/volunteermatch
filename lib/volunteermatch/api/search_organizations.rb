module Volunteermatch
  module API
    module SearchOrganizations
      def search_organizations(parameters = {})
        raise ArgumentError, 'location needs to be defined' if parameters[:location].nil? || parameters[:location].empty?
        parameters[:location] = parameters[:location] || nil
        call(:searchOrganizations, parameters.to_json)
      end
    end
  end
end
