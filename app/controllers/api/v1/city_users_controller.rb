class Api::V1::CityUsersController < ApplicationController
  before_action :set_city_user, only: [:show, :update, :destroy]

  # GET /city_users
  def index
    @city_users = CityUser.all

    render json: @city_users
  end

  # GET /city_users/1
  def show
    @city_user = CityUser.find_by(name: params[:id])

    render json: @city_user
  end

  # POST /city_users
  def create
    
    @city_user = CityUser.find_or_create_by(city_id: params[:city_id], user_id: params[:user_id])

    if @city_user.save
      render json: @city_user, status: :created
    else
      render json: @city_user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /city_users/1
  def update
    if @city_user.update(city_user_params)
      render json: @city_user
    else
      render json: @city_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /city_users/1
  def destroy
    @city_user.destroy
  end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_city_user
  #     @city_user = CityUser.find(params[:id])
  #   end
  #
  #   # Only allow a trusted parameter "white list" through.
  #   def city_user_params
  #     params.require(:city_user).permit(:user_id, :city_id)
  #   end
end
