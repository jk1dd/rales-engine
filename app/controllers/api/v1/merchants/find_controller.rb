class Api::V1::Merchants::FindController < ApplicationController

  def index
    render json:
    if params[:id]
      Merchant.where(id: params[:id])
    elsif params[:name]
      Merchant.where('lower(name) = ?', params[:name].downcase)
    elsif params[:created_at]
      Merchant.where(created_at: params[:created_at])
    elsif params[:updated_at]
      Merchant.where(updated_at: params[:updated_at])
    end
  end


  def show
    render json:
    if params[:id]
      Merchant.find(params[:id])
    elsif params[:name]
      Merchant.find_by('lower(name) = ?', params[:name].downcase)
    elsif params[:created_at]
      Merchant.find_by(created_at: params[:created_at])
    elsif params[:updated_at]
      Merchant.find_by(updated_at: params[:updated_at])
    end
  end

end
