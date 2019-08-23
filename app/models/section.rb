class Section < ApplicationRecord
# associating the course to a section by using the belongs_to function. 
    belongs_to :course
    has_many :lessons
end
