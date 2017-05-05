class Api::V1::Invoices::FindController < ApplicationController

  def index
    if params[:status]
      render json: Invoice.where('lower(status) =?', params[:status].downcase)
    else
      render json: Invoice.where(find_params)
    end
  end

  def show
    if params[:status]
      render json: Invoice.find_by('lower(status) =?', params[:status].downcase)
    else
      render json: Invoice.find_by(find_params)
    end
  end

  private

  def find_params
    params.permit(:id,
                  :status,
                  :merchant_id,
                  :customer_id,
                  :created_at,
                  :updated_at)
  end
end