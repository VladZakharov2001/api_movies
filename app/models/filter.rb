class Filter < ApplicationRecord
    belongs_to :user
    validates :ganre, presence: true
end
