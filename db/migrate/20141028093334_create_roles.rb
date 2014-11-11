class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :designation

      t.timestamps
    end
  end
end
