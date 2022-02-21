class Purchase < ApplicationRecord
  has_many :items, class_name: 'PurchaseItem'
  belongs_to :user

  def self.to_csv(options = {})
    attributes = %w{ id sub_total created_at updated_at token status user_id }
    CSV.generate(options.to_s, headers: true) do |csv|
      csv << attributes

      all.each do |purchase|
        csv << purchase.attributes.values_at(*attributes)
      end
    end
  end
end
