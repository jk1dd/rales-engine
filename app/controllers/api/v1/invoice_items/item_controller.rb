class Api::V1::InvoiceItems::ItemController < ApplicationController
  def show
    render json: Item.joins(:invoice_items).where('items.id' => params[:invoice_item_id])
  end
end
