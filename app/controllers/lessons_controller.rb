class LessonsController < ApplicationController
  before_action :find_user
  def index
  end

  def lesson1
    find_lesson(1)
  end

  def lesson2
    find_lesson(2)
  end

  def lesson3
    find_lesson(3)
  end

  def lesson4
    find_lesson(4)
  end

  def lesson5
    find_lesson(5)
  end

  def lesson6
    find_lesson(6)
  end

  def lesson7
    find_lesson(7)
  end

  def lesson8
    find_lesson(8)
  end

  def lesson9
    find_lesson(9)
  end

  def lesson10
    find_lesson(10)
  end

  def lesson11
    find_lesson(11)
  end

  def lesson12
    find_lesson(12)
  end

  def lesson13
    find_lesson(13)
  end

  def lesson14
    find_lesson(14)
  end

  def lesson15
    find_lesson(15)
  end

  def lesson16
    find_lesson(16)
  end

  def lesson17
    find_lesson(17)
  end

  def lesson18
    find_lesson(18)
  end

  def lesson19
    find_lesson(19)
  end

  def lesson20
    find_lesson(20)
  end

  def lesson21
    find_lesson(21)
  end
  #before
  def find_user
    @user = User.find(current_user.id)
  end

  def find_lesson(lesson)
    @lesson = Lesson.find(lesson)
  end
end
