class RemoveindexToschools < ActiveRecord::Migration
  def change
    remove_index :schools, name: 'name'
  end
end
