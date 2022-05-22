require 'rails_helper'

RSpec.describe ShippingAddress, type: :model do
  belongs_to   :purchase_record
end
