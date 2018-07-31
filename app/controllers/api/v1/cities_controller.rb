require 'pry'

class Api::V1::CitiesController < ApplicationController
  before_action :find_city, only: [:update]
  def index
    @cities = City.all
    render json: @cities
  end

  def show
   # ask if show message needs to render what is in database
   @city = City.find_by(name: params[:id])
   render json: @city, status: :accepted
  end

  def create

    #find or create by when favorite button is clicked on city page
    @city = City.find_or_create_by(name: params[:name], maxTemp: params[:maxTemp], minTemp: params[:minTemp])

    if @city.save
      render json: @city, status: :created
    else
      render json: @city.errors, status: :unprocessable_entity
    end
  end

  def update
    @city.update(city_params)
    if @city.save
      render json: @city, status: :accepted
    else
      render json: { errors: @city.errors.full_messages }, status: :unprocessible_entity
    end
  end

  # private
  #
  # def city_params
  #   params.permit(:name)
  # end
  #
  # def find_city
  #   @city = City.find(params[:id])
  # end
end
