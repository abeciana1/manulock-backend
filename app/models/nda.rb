class Nda < ApplicationRecord
    belongs_to :user
    belongs_to :document

    validates :signed_at, presence: true, if: -> { signed? }
    validates :pdf_url, presence: true, if: -> { signed? }

    enum signed: {
        unsigned: 0,
        signed: 1
    }
end
