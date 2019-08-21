class Course < ApplicationRecord
# associations between our users and courses

    belongs_to :user

# this validates that a course has a appropriate information upon creation.  

    validates :title, presence: true
    validates :description, presence: true
# will validate that the cost is greater than 0. 
    validates :cost, presence: true, numericality: {greater_than_or_equal_to: 0}
end
