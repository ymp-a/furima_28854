class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update]
  before_action :move_to_usersession, only: [:new, :edit]
  def index
    @item = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end
  private

  def set_item
    @item = Item.find(params[:id])
  end
  
  def move_to_usersession
    redirect_to user_session_path unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:image, :name, :item_descrption, :category_id, :status_id,
                                 :cost_bearer_id, :consignor_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end
end
