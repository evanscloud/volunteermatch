module Volunteermatch
  module API
    module HelloWorld
      def test(name)
        call(:helloWorld, {:name => name}.to_json)
      end
    end
  end
end