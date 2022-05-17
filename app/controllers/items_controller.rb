class ItemsController < ApplicationController
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
    redirect_to new_user_session_path unless user_signed_in?
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
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit([:image, :title, :price, :explanation, :category_id, :status_id, :fee_burden_id, :ship_area_id,
                                  :ship_day_id]).merge(user_id: current_user.id)
  end
end
