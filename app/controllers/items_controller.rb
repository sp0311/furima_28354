class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :new, :show]
  before_action :set_item, except: [:index, :new, :create]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  

  def create
    @item = Item.new(item_params)
    if @item.save
      @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @item.update(item_params)
    redirect_to root_path
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render 'show'
    end
  end

  def show
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :category_id, :item_condition_id, :postage_payer_id, :preparation_day_id, :image, :prefecture_code_id)
          .merge(user_id: current_user.id)
  end
end
