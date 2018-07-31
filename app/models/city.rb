class City < ApplicationRecord
  has_many :city_users
  has_many :users, :through => :city_users
end
