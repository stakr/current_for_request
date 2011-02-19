module Stakr #:nodoc:
  module CurrentForRequest #:nodoc:
    
    class Rack #:nodoc:
      
      def initialize(app, class_name, method = :current=, reset_value = nil)
        @app          = app
        @class_name   = class_name
        @method       = method
        @reset_value  = reset_value
      end
      
      def call(env)
        begin
          klass = @class_name.constantize
          klass.send(@method, klass.respond_to?(:from_env) ? klass.from_env(env) : nil)
          return @app.call(env)
        ensure
          klass.send(@method, @reset_value)
        end
      end
      
    end
    
  end
end
