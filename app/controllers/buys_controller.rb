class BuysController < ApplicationController
  before_action :authenticate_user!

  def index
    @pay= Pay.new
    @item= Item.find(params[:item_id])
    if current_user && @item.buy.present?
      redirect_to root_path
    end      
  end

  def create
    @pay= Pay.new(buy_params)
    if @pay.valid?
      card_item
      @pay.save
      redirect_to root_path
    else
      @item= Item.find(params[:item_id])
      render :index
    end
  end

private
def buy_params
      params.require(:pay).permit(:address,:region_id,:municipality,:house_number,:building_name,:tel).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
end
  def card_item
    Payjp.api_key= ENV['PAYJP_SECRET_KEY']
    @item= Item.find(params[:item_id]) 
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end
  def non_purchased_item
    # itemがあっての、order_form（入れ子構造）。他のコントローラーで生成されたitemを使うにはcreateアクションに定義する。
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.buy.present?
  end

end
