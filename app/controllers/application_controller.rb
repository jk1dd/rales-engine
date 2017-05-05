class ApplicationController < ActionController::API
  def format_incoming_price(price)
    (price.to_f * 100.00).round(2).to_i
  end
end
