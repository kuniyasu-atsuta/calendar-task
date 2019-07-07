class CreateSuccesses < ActiveRecord::Migration[5.2]
  def change
    create_table :successes do |t|
      t.belongs_to :user, index: true
      t.belongs_to :lesson, index: true
      t.datetime :success_date
      t.timestamps
    end
    add_index :successes, [:user_id, :lesson_id], unique: true
  end
end
