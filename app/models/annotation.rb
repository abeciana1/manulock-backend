class Annotation < ApplicationRecord
    belongs_to :document
    has_many :comments, dependent: :destroy

    enum annotation_type: {
        highlight: 0,
        comment: 1
    }

    validates :page_number, :selected_text, :annotation_type, presence: true
    validates :annotation_type, numericality: { less_than_or_equal_to: 1 }
end
