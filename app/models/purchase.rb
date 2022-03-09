class Purchase < ApplicationRecord
  include AASM
  has_many :items, class_name: 'PurchaseItem'
  belongs_to :user

  aasm timestamps: true do
    state :unverified, initial: true
    state :accepted
    state :rejected
    state :paid
    state :sent
    state :received

    event :accept do
      transitions from: [:unverified], to: :accepted
    end

    event :reject do
      transitions from: [:unverified], to: :rejected
    end

    event :reverify do
      transitions from: [:accepted], to: :unverified
    end

    event :pay do
      transitions from: [:accepted], to: :paid
    end

    event :unpay do
      transitions from: [:paid], to: :verified
    end

    event :sending do
      transitions from: [:paid], to: :sent
    end

    event :receive do
      transitions from: [:sent], to: :received
    end
  end

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
