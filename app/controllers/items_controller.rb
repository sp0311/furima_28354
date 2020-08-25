class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :new]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :category_id, :item_condition_id, :postage_payer_id, :preparation_day_id, :image, :prefecture_code_id)
          .merge(user_id: current_user.id)
end
end
