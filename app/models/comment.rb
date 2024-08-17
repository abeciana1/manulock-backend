class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :annotation

    validates :content, presence: true
end
