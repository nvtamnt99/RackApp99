# frozen_string_literal: true

$LOAD_PATH << '.'
require 'rack'
require 'tilt'
require 'lib/frack/application'
require 'lib/frack/base_controller'
require 'app/models/user'
require 'app/controllers/users_controller'
require 'app/controllers/welcomes_controller'

use Rack::Static, root: 'public', urls: ['/images', '/js', '/css']
use Rack::CommonLogger
use Rack::ContentLength
run Frack::Application
