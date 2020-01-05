module Frack
  class Router
    ROUTES = [
      {
        request_method: 'get',
        request_path: '/',
        mapping: 'UsersController#new'
      },
      {
        request_method: 'get',
        request_path: '/sign_up',
        mapping: 'UsersController#new'
  },
      {
        request_method: 'post',
        request_path: '/sign_up',
        mapping: 'UsersController#create'
      },
      {
        '/' => 'WelcomesController#index',
        '/users' => 'UsersController#index',
        '/sign_up' => 'UsersController#new'
      }
  ]

    def initialize(app)
      @app = app
    end

    def call(env)
      request_method = env['REQUEST_METHOD'].downcase
      request_path = env['PATH_INFO']

      ROUTES = ROUTES.find do |i|
        i[:request_method] == request_method &&
        i[:request_path] == request_path
      end

      if (mapping = ROUTES[env['PATH_INFO']])
        env.merge!(controller_action(mapping))
        @app.call(env)
      else
        Rack::Response.new('Not found',404)
      end
    end

    def controller_action(mapping)
      Hash[ %w(controller action).zip mapping.split('#')]
    end
  end
end
