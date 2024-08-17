class Subscription < ApplicationRecord
    belongs_to :user

    enum plan: { starter: 0, premium: 1, pro: 2 }

    validates :plan, presence: true
    validates :documents_remaining, :invites_remaining, numericality: { greater_than_or_equal_to: 0 }
end
