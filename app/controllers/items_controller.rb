class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :new]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end
  
  def create
    Item.create(item_params)
  end

  private 
  def item_params
  params.require(:item).permit(:image, :text)
  end
end