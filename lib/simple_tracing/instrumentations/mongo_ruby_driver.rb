module Mongo
  module Logging
    module Instrumenter
      def self.instrument(name, payload={}, &block)
        yield unless Trace.tracing?

        Trace.trace("mongo", payload) do
          block.call()
        end
      end
    end
  end
end
