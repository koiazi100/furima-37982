class PurchaseRecordShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :purchase_record_id,
                :token

  validates :postcode, format: { with: /\A\d{3}-\d{4}\z/ }, allow_blank: true
  validates :postcode, presence: true
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :city, presence: true
  validates :block, presence: true
  validates :phone_number, format: { with: /\A\d{10,11}\z/ }, allow_blank: true
  validates :phone_number, presence: true
  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :token, presence: true

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    shipping_addresses = ShippingAddress.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block,
                                                building: building, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end
