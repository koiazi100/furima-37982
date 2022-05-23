class Item < ApplicationRecord
  with_options presence: true do
   validates :title
   validates :explanation
   validates :price
   validates :category_id
   validates :status_id
   validates :fee_burden_id
   validates :ship_day_id
   validates :ship_area_id
   validates :image,presence:{message: "を選択してください" }
  end

  validates :price, length: { minimum: 3, maxinum: 7 }, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 },
                    format: { with: /\A[0-9]+\z/ }, allow_blank: true
  validates :category_id, :fee_burden_id, :ship_area_id, :ship_day_id, :status_id,
            numericality: { other_than: 1, message: "を選択してください" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :ship_area
  belongs_to :category
  belongs_to :fee_burden
  belongs_to :ship_day
  belongs_to :status

  has_one_attached :image
  belongs_to :user
  has_one :purchase_record
end
