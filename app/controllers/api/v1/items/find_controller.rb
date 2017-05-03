class Api::V1::Items::FindController < ApplicationController
  def index
    render json:
    if params[:id]
      Item.where(id: params[:id])
    elsif params[:name]
      Item.where('lower(name) =?', params[:name].downcase)
    elsif params[:description]
      Item.where('lower(description) =?', params[:description].downcase)
    elsif params[:merchant_id]
      Item.where(merchant_id: params[:merchant_id])
    elsif params[:unit_price]
      Item.where(unit_price: (params[:unit_price].to_f * 100.00).round(2).to_i)
    elsif params[:created_at]
      Item.where(created_at: params[:created_at])
    elsif params[:updated_at]
      Item.where(updated_at: params[:updated_at])
    end
  end

  def show
    render json:
    if params[:id]
      Item.find(params[:id])
    elsif params[:name]
      Item.find_by('lower(name) =?', params[:name].downcase)
    elsif params[:description]
      Item.find_by('lower(description) =?', params[:description].downcase)
    elsif params[:merchant_id]
      Item.find_by(merchant_id: params[:merchant_id])
    elsif params[:unit_price]
      Item.find_by(unit_price: (params[:unit_price].to_f * 100.00).round(2).to_i)
    elsif params[:created_at]
      Item.where(created_at: params[:created_at]).first
    elsif params[:updated_at]
      Item.where(updated_at: params[:updated_at]).first
    end
  end
end