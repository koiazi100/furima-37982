class PurchaseRecordShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number, 
                :token

with_options presence: true do
  validates :token
  validates :postcode
  validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :city
  validates :block
  validates :phone_number
  validates :user_id
  validates :item_id
  
end
validates :postcode, format: { with: /\A\d{3}-\d{4}\z/ }, allow_blank: true
validates :phone_number, format: { with: /\A\d{10,11}\z/ }, allow_blank: true
  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    shipping_addresses = ShippingAddress.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block,
                                                building: building, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end
