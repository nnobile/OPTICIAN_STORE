class Optometrist < ApplicationRecord
    has_many :patients
    has_many :opticians, through: :patients
end
