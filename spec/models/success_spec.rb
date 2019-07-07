# == Schema Information
#
# Table name: successes
#
#  id           :bigint           not null, primary key
#  success_date :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  lesson_id    :bigint
#  user_id      :bigint
#
# Indexes
#
#  index_successes_on_lesson_id              (lesson_id)
#  index_successes_on_user_id                (user_id)
#  index_successes_on_user_id_and_lesson_id  (user_id,lesson_id) UNIQUE
#

require 'rails_helper'

RSpec.describe Success, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
