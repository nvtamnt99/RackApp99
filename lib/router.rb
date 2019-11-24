module Frack
  class Router
    ROUTES = {
      '/' => 'WelcomesController'
      '/users' => 'UsersController'
    }

    def call(env)
      if (mapping = ROUTES[env[PATH_INFO]])
        env.merge!(mapping)
      else
        Rack::Response.new('Not found',404)
      end
    end
  end
end
