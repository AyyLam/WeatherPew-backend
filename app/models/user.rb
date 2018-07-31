class User < ApplicationRecord
  has_many :city_users
  has_many :cities, :through => :city_users

  def formatted_json
    {user: self, cities: self.cities}
  end

end
