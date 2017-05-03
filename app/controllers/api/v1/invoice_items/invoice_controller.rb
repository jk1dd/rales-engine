class Api::V1::InvoiceItems::InvoiceController < ApplicationController
  def show
    render json: Invoice.joins(:invoice_items).where('invoices.id' => params[:invoice_item_id])
  end
end
