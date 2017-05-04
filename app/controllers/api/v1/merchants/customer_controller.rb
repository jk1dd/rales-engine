class Api::V1::Merchants::CustomerController < ApplicationController
  def show
    render json: Customer.top_customer(params[:merchant_id])
  end
end