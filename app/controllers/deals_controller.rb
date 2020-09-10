class DealsController < ApplicationController
  before_action :move_to_usersession, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @deal = UserAddress.new
  end



  def create

    @item = Item.find(params[:item_id])
    @deal = UserAddress.new(deal_params)
    # binding.pry
    if @deal.valid?
      pay_item
      @deal.save
      return redirect_to root_path
    else
      render 'index'
    end
  end


  private

  def deal_params
    params.require(:user_address).permit(:postalcode, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def pay_item

    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,        # 商品の値段
      card: deal_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def move_to_usersession
    redirect_to user_session_path unless user_signed_in?
  end
end
