class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :gender
      t.belongs_to :section
      t.string :city

      t.timestamps
    end
  end
end
