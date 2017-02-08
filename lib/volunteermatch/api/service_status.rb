module Volunteermatch
  module API
    module ServiceStatus
      def service_status
        call(:getServiceStatus, {}.to_json)
      end
    end
  end
end
