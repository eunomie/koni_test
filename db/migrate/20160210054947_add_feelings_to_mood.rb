class AddFeelingsToMood < ActiveRecord::Migration[5.0]
  def up
    execute <<-SQL
      CREATE TYPE feeling AS ENUM ('good', 'ordinary', 'bad');
    SQL

    add_column :moods, :feeling, :feeling, index: true
  end

  def down
    remove_column :moods, :feeling

    execute <<-SQL
      DROP TYPE feeling;
    SQL
  end
end
