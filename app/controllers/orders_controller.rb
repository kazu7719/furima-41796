class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]
  before_action :set_item, only: [:index, :sold_out]
  before_action :move_to_root_path, only: [:index, :new, :create]
  before_action :sold_out, only: [:index]
  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_address = Order.new
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :municipalities, :street_address, :building_name, :number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_root_path
    @item = Item.find(params[:item_id])
    return unless @item.user_id == current_user.id

    redirect_to root_path
  end

  def sold_out
    return unless @item.order.present?

    redirect_to root_path
  end
end
