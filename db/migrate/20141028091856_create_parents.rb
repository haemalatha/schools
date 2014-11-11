class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.string :FatherName
      t.string :MotherName
      t.belongs_to :student
      t.string :occupation
      t.string :FatherEmail
      t.string :MotherEmail
      t.string :FatherMobile
      t.string :MotherMobile
      t.string :Address



      t.timestamps
    end
  end
end
