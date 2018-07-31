class CitySerializer < ActiveModel::Serializer
  attributes :id, :name, :minTemp, :maxTemp
end
