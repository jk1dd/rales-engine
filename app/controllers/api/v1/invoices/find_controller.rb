class Api::V1::Invoices::FindController < ApplicationController

  def index
    render json:
    if params[:id]
      Invoice.where(id: params[:id])
    elsif params[:status]
      Invoice.where('lower(status) =?', params[:status].downcase)
    elsif params[:merchant_id]
      Invoice.where(merchant_id: params[:merchant_id])
    elsif params[:customer_id]
      Invoice.where(customer_id: params[:customer_id])
    elsif params[:created_at]
      Invoice.where(created_at: params[:created_at])
    elsif params[:updated_at]
      Invoice.where(updated_at: params[:updated_at])
    end
  end

  def show
    render json:
    if params[:id]
      Invoice.find(params[:id])
    elsif params[:status]
      Invoice.find_by('lower(status) =?', params[:status].downcase)
    elsif params[:merchant_id]
      Invoice.find_by(merchant_id: params[:merchant_id])
    elsif params[:customer_id]
      Invoice.find_by(customer_id: params[:customer_id]) 
    elsif params[:created_at]
      Invoice.find_by(created_at: params[:created_at])
    elsif params[:updated_at]
      Invoice.find_by(updated_at: params[:updated_at])
    end
  end
end