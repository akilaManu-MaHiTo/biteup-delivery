require 'sinatra'
require 'json'
require 'mongoid'
require_relative '../model/DeliveryUser'

# Configure Mongoid
Mongoid.load!("mongoid.yml", :development)

# Post a new user
post '/users' do
  data = JSON.parse(request.body.read)

  user = User.new(data)
  if user.save
    status 201
    json({ id: user.id.to_s })
  else
    status 422
    json({ errors: user.errors.full_messages })
  end
end

# Get a user by ID
get '/users/:id' do
  id = BSON::ObjectId(params[:id])
  user = User.find_by(id: id)  # Use the User model to find the user
  halt 404, json({ error: 'User not found' }) unless user
  json user.as_json
end

# Delete a user
delete '/users/:id' do
  id = BSON::ObjectId(params[:id])
  user = User.find_by(id: id)
  halt 404, json({ error: 'User not found' }) unless user
  user.destroy
  status 204
end

# Get all users
get '/users' do
  users = User.all.map { |user| user.as_json }
  json users
end
