class Api::V1::Merchants::CustomerController < ApplicationController
  def index
    render json: Customer.customer_with_pending(params[:merchant_id])
  end

  def show
    render json: Customer.top_customer(params[:merchant_id]).first
  end
end