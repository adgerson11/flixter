class Instructor::SectionsController < ApplicationController
    before_action :authenticate_user!
    before_action :require_authorized_for_current_course

# associating the course id with the course section. 
    def new
        @section = Section.new
    end
# create a section in our database connected to the course and redirect the user to course page. 
    def create
        @section = current_course.sections.create(section_params)
        redirect_to instructor_course_path(current_course)
    end

    private 

    def require_authorized_for_current_course
        if current_course.user != current_user
            render plain: "Unauthorized", status: :unauthorized 
        end
    end 

    helper_method :current_course
    def current_course
        @current_course ||= Course.find(params[:course_id])
    end


    def section_params
        params.require(:section).permit(:title, :image)
    end
end
