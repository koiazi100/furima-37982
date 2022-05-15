class Item < ApplicationRecord
  validates :title, presence: true
  validates :explanation, presence: true
  validates :price, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :fee_burden_id, presence: true
  validates :ship_day_id, presence: true
  validates :ship_area_id, presence: true
  validates :user_id, presence: true
end
