class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :new, :show]

  def index
    @items = Item.all
    # order("created_at DESC")
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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :category_id, :item_condition_id, :postage_payer_id, :preparation_day_id, :image, :prefecture_code_id)
          .merge(user_id: current_user.id)
end
end
