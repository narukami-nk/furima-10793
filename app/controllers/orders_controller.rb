class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]
  before_action :move_to_root, only: :index

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      item_pay
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

private
  def set_item
    @item = Item.find(params[:item_id])
  end


  def item_pay
    Payjp.api_key = "sk_test_a09f151c59f473d0628745ef"
    Payjp::Charge.create(
    amount: @item.price,
    card:   order_address_params[:token],
    currency: 'jpy'
    )
  end

  def order_address_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :municipality,:address_number, :building, :telephone_number).merge(token: params[:token], user_id: current_user.id,item_id: @item.id)
  end

  def move_to_root
    redirect_to root_path if Order.exists?(item_id: @item.id) || current_user.id == @item.user.id
  end

end
