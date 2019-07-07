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

FactoryBot.define do
  factory :lesson do
    
  end
end
