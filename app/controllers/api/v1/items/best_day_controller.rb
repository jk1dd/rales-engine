class Api::V1::Items::BestDayController < ApplicationController
  def show
    render json: Invoice.item_best_day(params[:item_id])
  end
end
