# app/models/user.rb
class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :email, type: String
  field :age, type: Integer

  validates :email, presence: true, uniqueness: true
end
