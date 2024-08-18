class User < ApplicationRecord
    enum role: {
        inviter: 0,
        reviewer: 1
    }

    has_one :subscription, dependent: :destroy
    belongs_to :invited_by, class_name: 'User', optional: true
    has_many :invited_users, class_name: 'User', foreign_key: 'invited_by_id'
    has_many :documents, foreign_key: 'owner_id', dependent: :destroy
    has_many :beta_reader_invites, foreign_key: 'inviter_id', dependent: :destroy
    has_many :received_invites, class_name: 'BetaReaderInvite', foreign_key: 'invitee_id'
    has_many :comments, dependent: :destroy
    has_many :ndas, dependent: :destroy

    validates :first_name, :last_name, :email, :role, presence: true
    validates :email, uniqueness: true

    validates :invited_by_id, presence: true, unless: :inviter?
end
