class Api::V1::InvoiceItems::ItemController < ApplicationController
  def show
    render json: Item.joins(:invoice_items).where('invoice_items.id' => params[:invoice_item_id]).first
  end
end
