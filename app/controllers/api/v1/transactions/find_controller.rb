class Api::V1::Transactions::FindController < ApplicationController
  def index
    if params[:result]
      render json: Transaction.where('lower(result) = ?', params[:result].downcase)
    else
      render json: Transaction.where(find_params)
    end
    # if params[:id]
    #   Transaction.where(id: params[:id])
    # elsif params[:credit_card_number]
    #   Transaction.where(credit_card_number: params[:credit_card_number])
    # elsif params[:credit_card_expiration_date]
    #   Transaction.where(credit_card_expiration_date: params[:credit_card_expiration_date])
    # elsif params[:result]
    #   Transaction.where('lower(result) = ?', params[:result].downcase)
    # elsif params[:invoice_id]
    #   Transaction.where(invoice_id: params[:invoice_id])
    # elsif params[:created_at]
    #   Transaction.where(created_at: params[:created_at])
    # elsif params[:updated_at]
    #   Transaction.where(updated_at: params[:updated_at])
    # end
  end

  def show
    if params[:result]
      render json: Transaction.find_by('lower(result) = ?', params[:result].downcase)
    else
      render json: Transaction.find_by(find_params)
    end
  end

  private

  def find_params
    params.permit(:id,
                  :credit_card_number,
                  :credit_card_expiration_date,
                  :result,
                  :invoice_id,
                  :created_at,
                  :updated_at)
  end
end
