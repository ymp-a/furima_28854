class ItemsController < ApplicationController
  def index
    @item = Item.order("created_at DESC")
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

  private

  def item_params
    params.require(:item).permit(:image, :name, :item_descrption, :category_id, :status_id, :cost_bearer_id, :consignor_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end
end
