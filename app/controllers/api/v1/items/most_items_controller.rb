class Api::V1::Items::MostItemsController < ApplicationController

  def index
    render json: Item.top_sold_quantity(params[:quantity])
  end
end