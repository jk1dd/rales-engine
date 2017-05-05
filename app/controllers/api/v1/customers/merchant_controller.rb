class Api::V1::Customers::MerchantController < ApplicationController
  def show
    render json: Merchant.top_merchant(params[:customer_id]).first
  end
end