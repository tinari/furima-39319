class OrdersController < ApplicationController
  before_action :authenticate_user!, expect: :index

  def index
    @pay= pay.new
    @item= Item.find(params[:item_id])
  end

  def create
    @item= Item.find(params[:item_id])
    @pay= pay.new(buy_params)
    binding.pry
    if @pay.valid?
      @pay.save
      redirect_to root_path
    else
      @item= Item.find(params[:item_id])
      render :index
    end
  end

private
def pay_params
      params.require(:pay).permit(:address,:region_id,:municipality,:house_number,:tel).merge(item_id: @item_id, user_id: current_user.id)     
    end
end
