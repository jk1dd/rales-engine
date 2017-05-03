class Api::V1::InvoiceItems::InvoiceController < ApplicationController
  def show
    render json: Invoice.joins(:invoice_items).where('invoice_items.id' => params[:invoice_item_id]).first
  end
end
