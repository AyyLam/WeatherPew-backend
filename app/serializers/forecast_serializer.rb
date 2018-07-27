class ForecastSerializer < ActiveModel::Serializer
  attributes :id, :temp, :wind, :temp_min, :temp_max

  belongs_to :city 
end
