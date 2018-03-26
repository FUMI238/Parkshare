class ParksController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @parks = Park.includes(:user).order("id DESC")
    @search = Park.search(params[:q])
    @parks = @search.result
  end

  def new
  end

  def show
    @park = Park.find(params[:id])
  end

  def create
    Park.create(location: park_params[:location], comment: park_params[:comment], user_id: current_user.id)
  end

  def destroy
    park = Park.find(params[:id])
    park.destroy if park.user_id == current_user.id
  end

  def edit
    @park = Park.find(params[:id])
  end

  def update
    park = Park.find(params[:id])
    park.update(park_params) if park.user_id == current_user.id
  end

  private
    def park_params
      params.permit(:location, :comment)
    end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
