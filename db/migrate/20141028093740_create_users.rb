class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :gender
      t.belongs_to :role
      t.belongs_to :school
      t.string :city

      t.timestamps
    end
  end
end
