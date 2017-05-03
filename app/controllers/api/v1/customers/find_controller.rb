class Api::V1::Customers::FindController < ApplicationController
  def show
    render json:
    if params[:id]
      Customer.find(params[:id])
    elsif params[:first_name]
      Customer.find_by('lower(first_name) = ?', params[:first_name].downcase)
    elsif params[:last_name]
      Customer.find_by('lower(last_name) = ?', params[:last_name].downcase)
    elsif params[:created_at]
      Customer.find_by(created_at: params[:created_at])
    elsif params[:updated_at]
      Customer.find_by(updated_at: params[:updated_at])
    end
  end

  def index
    render json:
    if params[:id]
      Customer.where(id: params[:id])
    elsif params[:first_name]
      Customer.where('lower(first_name) = ?', params[:first_name].downcase)
    elsif params[:last_name]
      Customer.where('lower(last_name) = ?', params[:last_name].downcase)
    elsif params[:created_at]
      Customer.where(created_at: params[:created_at])
    elsif params[:updated_at]
      Customer.where(updated_at: params[:updated_at])
    end
  end
end
