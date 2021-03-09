class Version < ApplicationRecord
    validates :release_date, presence: true
end
