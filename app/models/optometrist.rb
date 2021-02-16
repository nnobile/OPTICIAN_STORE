class Optometrist < ApplicationRecord
    has_many :patients
    has_many :optometrists, through: :patients
end
