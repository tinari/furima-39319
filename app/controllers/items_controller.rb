class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :move_to_index, except: [:index]

  def index
  end

  def new
    @item=Item.new
  end

  def create
      @item= Item.new(item_params)
      if @item.save
        redirect_to root_path 
      else
        
        render :new, locals: { item: @item }
        

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
