class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show]

  def index
    @item = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
    redirect_to user_session_path unless user_signed_in?
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to user_session_path unless user_signed_in?
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end


  def item_params
    params.require(:item).permit(:image, :name, :item_descrption, :category_id, :status_id,
                                 :cost_bearer_id, :consignor_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end
end
