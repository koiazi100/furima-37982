class ItemsController < ApplicationController
  def index
  end

  private

  def item_params
    params.require(:item).permit([:image, :title, :explanation, :category_id, :status_id, :fee_burden_id, :ship_area_id, :ship_day_id]).merge(user_id: current_user.id)
  end
end
