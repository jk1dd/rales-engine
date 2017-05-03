class Api::V1::Invoices::ItemsController < ApplicationController
  def index
    render json: Item.joins(:invoice_items).where('invoice_items.invoice_id' => params[:invoice_id])
  end
end