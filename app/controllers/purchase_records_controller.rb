class PurchaseRecordsController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    if user_signed_in? && (current_user.id != @item.user.id) && @item.purchase_record.blank?
      @purchase_record_shipping_address = PurchaseRecordShippingAddress.new
    else
      redirect_to root_path
    end
  end

  def create
    @purchase_record_shipping_address = PurchaseRecordShippingAddress.new(purchase_params)
    if @purchase_record_shipping_address.valid?
      pay_item
      @purchase_record_shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_record_shipping_address).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
