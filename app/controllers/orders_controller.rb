class OrdersController < ApplicationController
  before_action :authenticate_user!, expect: :index
  before_action :set_item, only[:index, :create]

  def index
    @pay= pay.new

  end

  def create

    @pay= pay.new(buy_params)
    if @pay.valid?
      @pay.save
      redirect_to root_path
    else

      render :index
    end
  end

private
def pay_params
      params.require(:pay).permit(:address,:region_id,:municipality,:house_number,:tel).merge(user_id: current_user.id, item_id: @item_id, )     
    end

    def set_item
      @item = Item.find(params[:item_id])
end
