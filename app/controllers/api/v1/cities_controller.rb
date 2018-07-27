class Api::V1::CitiesController < ApplicationController
  before_action :find_city, only: [:update]
  def index
    @cities = City.all
    render json: @cities
  end

  def update
    @city.update(city_params)
    if @city.save
      render json: @city, status: :accepted
    else
      render json: { errors: @city.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def city_params
    params.permit(:name)
  end

  def find_city
    @city = City.find(params[:id])
  end
end

end
