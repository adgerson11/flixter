class CoursesController < ApplicationController
# used to defined the varibales for the index. 
    def index
        @courses = Course.all
    end 
end
