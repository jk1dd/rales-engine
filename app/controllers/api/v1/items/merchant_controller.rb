class Api::V1::Items::MerchantController < ApplicationController
  def show
    render json: Merchant.joins(:items).where('items.id' => params[:item_id]).first
  end
end
