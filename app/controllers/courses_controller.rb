class CoursesController < ApplicationController
    def create
      course = Course.new(course_params)
      if course.save
        tutor_params.each do |tutor_param|
          course.tutors.create(tutor_param.permit(:name, :email))
        end
        render json: course, include: :tutors, status: :created
      else
        render json: course.errors, status: :unprocessable_entity
      end
    end
  
    def index
      courses = Course.includes(:tutors).all
      render json: courses.to_json(include: :tutors)
    end
  
    private
  
    def course_params
      params.require(:course).permit(:name, :description)
    end
  
    def tutor_params
      params.require(:tutors)
    end
end