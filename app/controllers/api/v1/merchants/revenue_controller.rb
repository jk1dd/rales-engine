class Api::V1::Merchants::RevenueController < ApplicationController
  def show
    render json: Merchant.total_revenue(params[:merchant_id])
  end
end
