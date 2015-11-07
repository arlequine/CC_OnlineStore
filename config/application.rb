require 'active_record'
require 'sqlite3'
require 'yaml'
require_relative '../app/models/user'
require_relative '../app/models/product'
require_relative '../app/controllers/users_controller'
require_relative '../app/views/products_view'
require_relative '../app/views/users_view'

configuration = YAML::load_file(File.join(__dir__, 'database.yml'))
ActiveRecord::Base.establish_connection(configuration['development'])
