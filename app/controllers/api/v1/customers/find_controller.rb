class Api::V1::Customers::FindController < ApplicationController
  def show
    if params[:first_name]
      render json: Customer.find_by('lower(first_name) = ?', params[:first_name].downcase)
    elsif params[:last_name]
      render json: Customer.find_by('lower(last_name) = ?', params[:last_name].downcase)
    else
      render json: Customer.find_by(find_params)
    end
  end

  def index
    if params[:first_name]
      render json: Customer.where('lower(first_name) = ?', params[:first_name].downcase)
    elsif params[:last_name]
      render json: Customer.where('lower(last_name) = ?', params[:last_name].downcase)
    else
      render json: Customer.where(find_params)
    end
  end

  private

  def find_params
    params.permit(:id,
                  :first_name,
                  :last_name,
                  :created_at,
                  :updated_at)
  end
end
