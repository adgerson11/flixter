class Instructor::CoursesController < ApplicationController
# action to authenticate user before certain functions. 

    before_action :authenticate_user!

# Adding action to controller for instructor/courses 

    def new
        @course = Course.new
    end

# Method for creating a new course. 

    def create
        @course = current_user.courses.create(course_params)
        if @course.valid?
            redirect_to instructor_course_path(@course)
        else
            render :new, status: :unprocessable_entity
        end
    end

    def show
        @course = Course.find(params[:id])
    end 

private

    def course_params
        params.require(:course).permit(:title, :description, :cost)
    end

end
