class Api::V1::ForecastsController < ApplicationController
  before_action :find_forecast, only: [:update]
  def index
    @forecasts = Forecast.all
    render json: @forecasts
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
    params.permit(:title, :content)
  end

  def find_forecast
    @forecast = Forecast.find(params[:id])
  end

end
