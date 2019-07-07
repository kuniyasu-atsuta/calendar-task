class SuccessesController < ApplicationController

  def create
    @user = current_user
    lesson = Lesson.find(params[:lesson_id])
    @user.exp += 20
    @user.save(validate: false)
    # binding.pry
    @user.check(lesson)
    redirect_to "/lessons/#{current_user.id}/#{lesson.id.to_i + 1}"
  end

  # def update
  #   if @user.update(user_params)
  #     flash[:success] = 'アカウントを設定を更新しました！'
  #     redirect_to @user
  #   else
  #     render 'edit'
  #   end
  # end

  def destroy
    lesson = Successes.find(params[:id]).lesson
    current_user.remove_check(lesson)
    redirect_back(fallback_location: "/lessons/#{current_user.id}/#{lesson.id}")
  end
end
