require 'pry'

class Api::V1::CitiesController < ApplicationController
  before_action :find_city, only: [:update]
  def index
    @cities = City.all
    render json: @cities
  end

  def show
   # ask if show message needs to render what is in database

    query = params[:id]
    # binding.pry
    url = RestClient.get("https://api.weatherbit.io/v2.0/forecast/daily?city=#{query}&key=2aae1ad95d074ef69f7611fc50deb833")
    weather = JSON.parse url
    render json: weather
  end

  def create
    #find or create by when favorite button is clicked on city page

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
