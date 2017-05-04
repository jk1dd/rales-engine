class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    render json: Merchant.top_revenue(params[:quantity])
  end

  def show
    if params[:date]
      render json: Merchant.merchant_revenue_by_date(params[:merchant_id], params[:date])
    else
      render json: Merchant.total_revenue(params[:merchant_id])
    end
  end
end
