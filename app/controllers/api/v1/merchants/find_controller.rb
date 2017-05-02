class Api::V1::Merchants::FindController < ApplicationController

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
