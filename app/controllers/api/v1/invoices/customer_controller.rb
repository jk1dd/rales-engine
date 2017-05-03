class Api::V1::Invoices::CustomerController < ApplicationController

  def show
    render json: Customer.joins(:invoices).where('invoices.id' => params[:invoice_id])
  end

end