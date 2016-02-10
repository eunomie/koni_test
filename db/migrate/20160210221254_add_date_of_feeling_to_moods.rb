class AddDateOfFeelingToMoods < ActiveRecord::Migration[5.0]
  def change
    add_column :moods, :feeling_at, :date
  end
end
