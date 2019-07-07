# == Schema Information
#
# Table name: lessons
#
#  id           :bigint           not null, primary key
#  description1 :text(65535)
#  description2 :text(65535)
#  title        :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Lesson < ApplicationRecord
  has_many :successes, dependent: :destroy, foreign_key: "user_id"
  has_many :users, through: :success, source: :user
end
