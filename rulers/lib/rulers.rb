require "rulers/version"
require "rulers/array"
require "rulers/routing"
require "rulers/util"
require "rulers/dependencies"

module Rulers
  class Application
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, {'Content-Type' => 'text/html'}, []]
      end

      if env['PATH_INFO'] == '/'
        #klass = Object.const_get('QuotesController')
        #controller = QuotesController.new(env)
        #text = controller.a_quote
        #[200, {'Content-Type' => 'text/html'}, [File.open('public/index.html').read]]
        [301, {'Content-Type' => 'text/html', 'Location' => '/quotes/a_quote'}, []] # Browser redirect
      else
        klass, act = get_controller_and_action(env)
        controller = klass.new(env)
        begin
          text = controller.send(act)
        rescue
          text = "Raised exception in Rulers::Application#call"
        end

        [200, {'Content-Type' => 'text/html'}, [text]]
      end
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end
  end
end
