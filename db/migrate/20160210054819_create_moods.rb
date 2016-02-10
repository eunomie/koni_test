class CreateMoods < ActiveRecord::Migration[5.0]
  def change
    create_table :moods do |t|

      t.timestamps
    end
  end
end
