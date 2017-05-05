class Api::V1::Items::MostRevenueController < ApplicationController

  def index
    render json: Item.top_revenue(params[:quantity])
  end
end