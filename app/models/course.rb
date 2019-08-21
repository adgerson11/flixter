class Course < ApplicationRecord
# associations between our users and courses

    belongs_to :user
end
