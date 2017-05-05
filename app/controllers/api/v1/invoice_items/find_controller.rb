class Api::V1::InvoiceItems::FindController < ApplicationController

  def index
    if params[:unit_price]
      render json: InvoiceItem.where(unit_price: format_incoming_price(params[:unit_price]))
    else
      render json: InvoiceItem.where(find_params)
    end
  end

  def show
    if params[:unit_price]
      render json: InvoiceItem.find_by(unit_price: format_incoming_price(params[:unit_price]))
    else
      render json: InvoiceItem.find_by(find_params)
    end
  end

  private

  def find_params
    params.permit(:id,
                  :quantity,
                  :unit_price,
                  :invoice_id,
                  :item_id,
                  :created_at,
                  :updated_at)
  end
end