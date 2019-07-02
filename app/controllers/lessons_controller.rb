class LessonsController < ApplicationController
  before_action :find_user
  def index
  end

  def lesson1
  end

  def lesson2
  end

  def lesson3
  end

  def lesson4
  end

  def lesson5
  end

  def lesson6
  end

  def lesson7
  end

  def find_user
    @user = User.find(current_user.id)
  end
end
