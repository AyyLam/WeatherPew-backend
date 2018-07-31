class Api::V1::ForecastsController < ApplicationController
  before_action :find_forecast, only: [:update]
  def index
    @forecasts = Forecast.all
    render json: @forecasts
  end

  def show
    query = params[:id]
    # binding.pry
    url = RestClient.get("https://api.weatherbit.io/v2.0/forecast/daily?city=#{query}&key=89eacc89e0f940338f51398f9abd6006&units=I")
    weather = JSON.parse url
    render json: weather

  end

  def update
    @forecast.update(forecast_params)
    if @forecast.save
      render json: @forecast, status: :accepted
    else
      render json: { errors: @forecast.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def forecast_params
    params.permit(:temp, :wind, :temp_min, :temp_max)
  end

  def find_forecast
    @forecast = Forecast.find(params[:id])
  end

end
