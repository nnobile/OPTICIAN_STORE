class Patient < ApplicationRecord
    belongs_to :optometrist
    belongs_to :optician
end
