class Api::V1::Merchants::FindController < ApplicationController

  def index
    if params[:name]
      render json: Merchant.where('lower(name) = ?', params[:name].downcase)
    else
      render json: Merchant.where(find_params)
    end
  end


  def show

    if params[:name]
      render json: Merchant.find_by('lower(name) = ?', params[:name].downcase)
    else
      render json: Merchant.find_by(find_params)
    end
  end

  private

  def find_params
    params.permit(:id, :name, :created_at, :updated_at)
  end


end
