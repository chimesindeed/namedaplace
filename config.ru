require_relative './config/environment.rb'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end


use Rack::MethodOverride #needed to override current standard of Not including delete and put requests

run ApplicationController #main controller / others inherit from


#Secondary Controllers 
use SessionsController
use PlacesController
use UsersController
