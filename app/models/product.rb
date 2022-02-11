class Product < ApplicationRecord
  has_many :category_products
  has_many :categories, through: :category_products
  has_one_attached :photo

  accepts_nested_attributes_for :category_products
end