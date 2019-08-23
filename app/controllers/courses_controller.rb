class CoursesController < ApplicationController
# used to defined the varibales for the index. 
    def index
        @courses = Course.all
    end 
# will associate the routes to the courses show page. 
    def show
        @course = Course.find(params[:id])
    end
end
