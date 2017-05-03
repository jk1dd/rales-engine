class Api::V1::Invoices::MerchantController < ApplicationController
  def show
    render json: Merchant.joins(:invoices).where('invoices.id' => params[:invoice_id]).first
  end
end