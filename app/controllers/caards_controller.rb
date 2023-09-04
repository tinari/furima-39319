class CaardsController < ApplicationController
  def new
  end

  def create
    Payjp.ap_key= ENV=["PAYJP_SECRET_KEY"]
    customer= Payjp::Customer.create(
      description: 'test',
      card: params[:token]
    )
    card= Card.new(
      token: params[:token]
      customer_token: customer.id,
      user_id: current_user.id
    )
    if card.save
    redirect_to_root_path
      
    else
      redirect_to action: "new"
    end
  end
end
