require 'sinatra'
require 'sinatra/json'
require 'mongoid'
require 'json'

require_relative '../biteup-delivery/controllers/DeliveryController'

# Configure Mongoid
Mongoid.load!("mongoid.yml", :development)

# Routes
get '/' do
  'Ruby + MongoDB API is running!'
end
