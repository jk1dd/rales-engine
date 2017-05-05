class Api::V1::Merchants::RevenueDateController < ApplicationController

  def index
    render json: InvoiceItem.total_revenue_by_date(params[:date])
  end
end