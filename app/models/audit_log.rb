class AuditLog < ApplicationRecord
    belongs_to :user
    belongs_to :document
    belongs_to :beta_reader_invite, optional: true
    validates :action, presence: true
    enum action: { viewed_document: 0, added_comment: 1, completed_review: 2, accepted_invite: 3, declined_invite: 4 }
end
