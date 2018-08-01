class CitySerializer < ActiveModel::Serializer
  attributes :id, :name, :minTemp, :maxTemp, :temp, :wind_spd, :pop, :datetime, :rh, :country_code, :state_code
end
