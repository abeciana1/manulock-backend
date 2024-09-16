class UserSerializer < ActiveModel::Serializer
    attributes :id :first_name, :last_name, :invited_by_id

    has_one :subscription
    has_many :invited_users
    has_many :documents
    has_many :beta_reader_invites
    has_many :received_invites
    has_many :ndas
end