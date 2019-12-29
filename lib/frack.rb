$LOAD_PATH << File.expand_path('../', File.dirname(__FILE__))
$LOAD_PATH << File.expand_path(File.dirname(__FILE__))

require 'rack'
require 'tilt'
require 'bcrypt'

ENV['APP_ENV'] || 'development'
require 'erb'
require 'active_record'
require_relative '../config/database'
require 'app/validators/category_validator'
require 'app/models/user'
require 'app/models/category'
require 'app/models/product'
require 'app/models/order'
require 'app/models/order_detail'

module Frack
  autoload :Router, 'frack/router'
  autoload :Application, 'frack/application'
  autoload :BaseController, 'frack/base_controller'
end

require 'app/controllers/users_controller'
require 'app/controllers/welcomes_controller'
