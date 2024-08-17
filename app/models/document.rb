class Document < ApplicationRecord
    belongs_to :owner, class_name: 'User'
    has_many :annotations, dependent: :destroy
    has_many :comments, through: :annotations, dependent: :destroy
    has_many :ndas, dependent: :destroy

    validates :title, presence: true
end
