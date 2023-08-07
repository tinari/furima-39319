class ArticlesController < ApplicationController
  def new
    @item= Item.new
  end
end
