class Product < ApplicationRecord
  has_many :category_products
  has_many :categories, through: :category_products
  has_one_attached :photo

  accepts_nested_attributes_for :category_products

  def self.to_csv(options = {})
    attributes = %w{ id name description archived on_stock created_at updated_at uuid price }
    CSV.generate(options.to_s, headers: true) do |csv|
      csv << attributes

      all.each do |product|
        csv << product.attributes.values_at(*attributes)
      end
    end
  end

  def self.import(file)
    attributes = %w{ id name description archived on_stock created_at updated_at uuid price }
    CSV.foreach(file.path, headers: true) do |row|
      product = find_by_id(row["{}id"]) || new
      product.attributes = row.to_hash.slice(*attributes)
      product.save!
    end
  end
end