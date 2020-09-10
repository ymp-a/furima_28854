class DealsController < ApplicationController
  before_action :move_to_usersession, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    # @deal = Deal.new
  end


  private

  def move_to_usersession
    redirect_to user_session_path unless user_signed_in?
  end
end
