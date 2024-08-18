class Nda < ApplicationRecord
    enum signed: {
        unsigned: 0,
        signed: 1
    }
    
    belongs_to :user
    belongs_to :document

    validates :signed_at, :pdf_url, presence: true, unless: :signed?

end
