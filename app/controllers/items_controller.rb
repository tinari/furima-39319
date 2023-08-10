
class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @items= Item.all.order(created_at: :desc)
  end

  def new
    @item=Item.new
  end

  def create
      @item= Item.new(item_params)
      @item.image.attach(params[:item][:image]) if params[:item][:image]
      if @item.update
        redirect_to root_path 
      else
        render :new, locals: { item: @item }
      end
  
  end

  def show
    @item= Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end


  private

  def item_params
    params.require(:item).permit(:item, :image, :content, :price, 
                                 :category_id, :situation_id, :delivery_charge_id,  
                                 :region_id, :shipment_id).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end
end