module Volunteermatch
  module API
    module SearchOpportunities
      def search_opportunities(parameters = {})
        raise ArgumentError, 'location needs to be defined' if parameters[:location].nil? || parameters[:location].empty?
        parameters[:location] = parameters[:location] || nil
        call(:SearchOpportunities, parameters.to_json)
      end
    end
  end
end
