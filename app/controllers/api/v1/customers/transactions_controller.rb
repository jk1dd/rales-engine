class Api::V1::Customers::TransactionsController < ApplicationController

  def index
    render json: Transaction.joins(invoice: :customer).where('customers.id' => params[:customer_id])
  end
end