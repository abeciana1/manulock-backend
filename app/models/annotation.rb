class Annotation < ApplicationRecord
    belongs_to :document
    has_many :comments, dependent: :destroy

    validates :page_number, :selected_text, presence: true
end
