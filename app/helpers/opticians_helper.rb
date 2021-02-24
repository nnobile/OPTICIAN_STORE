module OpticiansHelper

    def optician_full_name
        [@optician.first_name, @optician.last_name].join(' ')
    end

end
