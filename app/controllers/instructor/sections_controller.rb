class Instructor::SectionsController < ApplicationController
# associating the course id with the course section. 
    def new
        @course = Course.find(params[:course_id])
# new sections for each form.
        @section = Section.new
    end
# create a section in our database connected to the course and redirect the user to course page. 
    def create
        @course = Course.find(params[:course_id])
        @section = @course.sections.create(section_params)
        redirect_to instructor_course_path(@course)
    end

    private 

    def section_params
        params.require(:section).permit(:title)
    end
end
