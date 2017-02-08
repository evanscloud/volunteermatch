module Volunteermatch
  module API
    module Metadata
      def metadata(version = 0)
        call(:getMetadata, {:version => version}.to_json)
      end
    end
  end
end
