class Email < ApplicationRecord
    belongs_to :user
    has_many :email_events, dependent: :destroy

    validates :name, :subject, :body, :sent_at, presence: true
end
