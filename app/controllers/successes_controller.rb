class SuccessesController < ApplicationController

  def create
    lesson = Lesson.find(params[:lesson_id])
    current_user.check(lesson)
    redirect_to "/lessons/#{current_user.id}/#{lesson.id.to_i + 1}"
  end

  def destroy
    lesson = Successes.find(params[:id]).lesson
    current_user.remove_check(lesson)
    redirect_back(fallback_location: "/lessons/#{current_user.id}/#{lesson.id}")
  end
end
