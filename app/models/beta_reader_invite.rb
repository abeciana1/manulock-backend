class BetaReaderInvite < ApplicationRecord
    belongs_to :inviter, class_name: 'User'
    belongs_to :invitee, class_name: 'User', optional: true
    belongs_to :document
    enum status: { active: 0, invited: 1, revoked: 2 }

    validates :email, :document_id, :status, presence: true
    validates :status, numericality: { greater_than_or_equal_to: 0 }
end
