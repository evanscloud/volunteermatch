module Volunteermatch
  module API
    module Metadata
      def metadata(version = nil)
        call(:getMetaData, {:version => version}.to_json)
      end
    end
  end
end
