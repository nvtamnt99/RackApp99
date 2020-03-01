$LOAD_PATH << File.expand_path('../', File.dirname(__FILE__))
$LOAD_PATH << File.expand_path(File.dirname(__FILE__))

require 'dotenv/load'

require 'rack'
require 'tilt'
require 'bcrypt'
require 'byebug'

ENV['APP_ENV'] || 'development'
require 'erb'
require 'active_record'
require 'action_mailer'

require "letter_opener"
ActionMailer::Base.add_delivery_method :letter_opener, LetterOpener::DeliveryMethod, :location => File.expand_path('../tmp/letter_opener', __FILE__)
ActionMailer::Base.delivery_method = :letter_opener

ActionMailer::Base.prepend_view_path(File.expand_path('../app/views/', __dir__))
require 'app/mailers/application_mailer'
require 'app/mailers/user_mailer'

ActiveRecord::Base.logger = Logger.new(STDOUT)
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
require 'app/controllers/products_controller'
