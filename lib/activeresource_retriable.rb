require 'activeresource'
require 'retriable'

module ActiveResource
  class RetriableBase < Base
    def self.retriable
      @@retriable_configuration = yield
      self.connection_class = Class.new(Connection) do
        def request(method, path, *arguments)
          Retriable.retriable(@@retriable_configuration) { super }
        end
      end
    end
  end
end
