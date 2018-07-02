class Song < ActiveRecord::Base
    validates :title, presence: true
    # title cannot be repeated by the same artist in the same year
    validates :title, uniqueness: { scope: [:release_year, :artist_name] }
    validates :released, inclusion: { in: [true, false]}
    validate :release_year_validation
    
    

    def release_year_validation
        # Optional if released is false
        # Must not be blank if released is true
        # Must be less than or equal to the current year
        # EXAMPLE
        # if expiration_date.present? && expiration_date < Date.today
        #     errors.add(:expiration_date, "can't be in the past")
        # end
        if released
            if !release_year.present? || release_year > 2018
                errors.add(:release_year)
            end
        end
    end


end
