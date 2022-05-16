class Item < ApplicationRecord
  validates :title, presence: true
  validates :explanation, presence: true
  validates :price, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :fee_burden_id, presence: true
  validates :ship_day_id, presence: true
  validates :ship_area_id, presence: true
  validates :image, presence: true

  validates :price, length: { minimum: 3, maxinum: 7 }, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 },
                    format: { with: /\A[0-9]+\z/ }, allow_blank: true
  validates :category_id, :fee_burden_id, :ship_area_id, :ship_day_id, :status_id,
            numericality: { other_than: 1, message: "can't be blank" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :ship_area, :category, :fee_burden, :ship_day, :status

  has_one_attached :image
  belongs_to :user
   # has_one :purchase_record
end
