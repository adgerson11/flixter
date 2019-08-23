class Instructor::LessonsController < ApplicationController

    before_action :authenticate_user!
    before_actin :require_authorized_for_current_section

# load section that's referenced by URL. 
    def new
# adding unauthorized access to the page if trying to add to lesson another user created. 
        #if current_section.course.user != current_user
            #return render plain: 'Unauthorized', status: :unauthorized
        #end
        @lesson = Lesson.new
    end
# associate the create button with lessons and sections. 
    def create
        #if current_section.course.user != current_user
            #return render plain: 'Unauthorized', status: :unauthorized
        @lesson = current_section.lessons.create(lesson_params)
        redirect_to instructor_course_path(current_section.course)
    end 

    private

    
    def require_authorized_for_current_section
        if current_sectin.course.user != current_user
            return render plain: 'Unauthorized', status: :unauthorized
        end 
    end 
# this moves the redundant code from above inside its own function with the name of current_section.
    helper_method :current_section
    def current_section
        @current_section ||= Section.find(params[:section_id])
    end

    def lesson_params
        params.require(:lesson).permit(:title, :subtitle)
    end

end
