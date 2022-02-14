class Purchase < ApplicationRecord
  has_many :items, class_name: 'PurchaseItem'
  belongs_to :user
end
