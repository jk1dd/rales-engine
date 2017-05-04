class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    render json: Merchant.top_revenue(params[:quantity])
  end

  def show
    render json: Merchant.total_revenue(params[:merchant_id])
  end
end
