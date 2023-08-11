
class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update]

  def index
    @items= Item.all.order(created_at: :desc)
  end

  def new
    @item=Item.new
  end

  def create
      @item= Item.new(item_params)
      @item.image.attach(params[:item][:image]) if params[:item][:image]
      if @item.save
        redirect_to root_path 
      else
        render :new, locals: { item: @item }
      end
  
  end

  def show
  end

  def edit
    if current_user && @item.user == current_user
      render :edit
    else
      redirect_to root_path
    end
  end
  
  def update
  
    
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

  def set_item
    @item= Item.find(params[:id])
  end
end