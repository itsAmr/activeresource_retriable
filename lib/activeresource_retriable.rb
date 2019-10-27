require 'activeresource'
require 'retriable'

module ActiveResource
  class Retriable
    def self.configure
      ::Retriable.configure do |c|
        yield(c)

        c.contexts.each do |name, config|
          named_retriable = Class.new(RetriableBase)
          named_retriable.instance_eval do
            def request(method, path, *arguments)
              ::Retriable.with_context(name) { super }
            end
          end
          RetriableBase.const_set(name.to_s.capitalize, named_retriable)
        end
      end
    end
  end

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
