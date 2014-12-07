class Meeting < ActiveRecord::Base
    # Validations
    validates :title, :date, :presence => true, :allow_blank => false
end
