class AddindexToschools < ActiveRecord::Migration
  def down
    remove_index :schools, :name
  end

  def up
    add_index :schools, :name, unique: true
  end
end
