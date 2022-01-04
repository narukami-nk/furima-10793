class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :move_to_index, only: [:edit]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @item = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_text, :category_id, :condition_id, :delivery_type_id, :prefecture_id,
                                 :shipping_period_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    redirect_to action: :index unless current_user.id == @item.user.id
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
