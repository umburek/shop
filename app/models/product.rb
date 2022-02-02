class Product < ApplicationRecord
  has_many :category_products, dependent: :destroy
  has_many :categories, through: :category_products
  has_many_attached :photos

  accepts_nested_attributes_for :category_products
end