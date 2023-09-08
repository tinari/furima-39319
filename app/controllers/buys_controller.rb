class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @pay= Pay.new
    non_purchased_item     
  end

  def create
    @pay= Pay.new(buy_params)
    if @pay.valid?
      card_item
      @pay.save
      redirect_to root_path
    else
      render :index
    end
  end

private
def buy_params
      params.require(:pay).permit(:address,:region_id,:municipality,:house_number,:building_name,:tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
end
  def card_item
    Payjp.api_key= ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end

  def non_purchased_item
    # itemがあっての、order_form（入れ子構造）。他のコントローラーで生成されたitemを使うにはcreateアクションに定義する。
    if current_user && @item.buy.present? && current_user == @item.user
      redirect_to root_path
    end
  end

  def set_item
  @item = Item.find(params[:item_id])
 end
end
