module Volunteermatch
  module API
    module KeyStatus
      def key_status
        call(:getKeyStatus, {}.to_json)
      end
    end
  end
end
