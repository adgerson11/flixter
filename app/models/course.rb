class Course < ApplicationRecord
# associations between our users and courses
    mount_uploader :image, ImageUploader

    belongs_to :user
    has_many :sections
    has_many :enrollments

# this validates that a course has a appropriate information upon creation.  

    validates :title, presence: true
    validates :description, presence: true
# will validate that the cost is greater than 0. 
    validates :cost, presence: true, numericality: {greater_than_or_equal_to: 0}

    def free?
        cost.zero?
    end

    def premium?
        ! free?
    end
end
