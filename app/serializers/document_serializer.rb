class DocumentSerializer < ActiveModel::Serializer
    attributes :id, :title, :hosted_url, :owner_id, :created_at, :updated_at, :owner_id

    has_one :owner
    has_many :annotations
    has_many :comments
    has_many :ndas
end