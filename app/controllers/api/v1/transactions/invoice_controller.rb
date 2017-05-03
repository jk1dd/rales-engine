class Api::V1::Transactions::InvoiceController < ApplicationController

  def show
    render json: Invoice.joins(:transactions).where('transactions.id' => params[:transaction_id])
  end
end