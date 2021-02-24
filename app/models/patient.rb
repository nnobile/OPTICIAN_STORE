class Patient < ApplicationRecord
    belongs_to :optometrist
    belongs_to :optician
    validates :first_name, :last_name, presence: true
    accepts_nested_attributes_for :optometrist


    #scope :patients_optician, -> (opt_id){where('optician_id = ?', opt_id)}

    def self.ordered_by_revenue
        self.order(total_revenue: :desc)
    end

end
