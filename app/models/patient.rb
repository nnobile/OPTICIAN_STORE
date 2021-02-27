class Patient < ApplicationRecord
    belongs_to :optometrist
    belongs_to :optician
    validates :first_name, :last_name, presence: true
    #accepts_nested_attributes_for :optometrist

    def self.ordered_by_revenue
        self.order(total_revenue: :desc)
    end

    def self.count_of_patients
        self.length
    end

    def full_name
        full_name = [last_name, first_name].map(&:capitalize).join(", ")
    end
    
end
