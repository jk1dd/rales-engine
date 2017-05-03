class Api::V1::InvoiceItems::FindController < ApplicationController

  def index
    render json:
    if params[:id]
      InvoiceItem.where(id: params[:id])
    elsif params[:quantity]
      InvoiceItem.where(quantity: params[:quantity])
    elsif params[:unit_price]
      InvoiceItem.where(unit_price: (params[:unit_price].to_f * 100.00).round(2).to_i)
    elsif params[:created_at]
      InvoiceItem.where(created_at: params[:created_at])
    elsif params[:updated_at]
      InvoiceItem.where(updated_at: params[:updated_at])
    end
  end

  def show
    render json:
    if params[:id]
      InvoiceItem.find(params[:id])
    elsif params[:quantity]
      InvoiceItem.find_by(quantity: params[:quantity])
    elsif params[:unit_price]
      InvoiceItem.find_by(unit_price: (params[:unit_price].to_f * 100.00).round(2).to_i)
    elsif params[:created_at]
      InvoiceItem.find_by(created_at: params[:created_at])
    elsif params[:updated_at]
      InvoiceItem.find_by(updated_at: params[:updated_at])
    end
  end
end