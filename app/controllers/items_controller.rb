class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :new]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    # Item.create(item_params)
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
  params.require(:item).permit(:name, :introduction,:price, :category,:item_condition, :postage_payer, :preparation_day,:postage_type, :image, :prefecture_code)
  end

end