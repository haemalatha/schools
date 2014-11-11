class AddcolumnsTostudents < ActiveRecord::Migration
  def change
    add_column :students, :AdmissionNumber, :integer
    add_column :students, :RollNumber, :integer
    add_column :students, :DateOfBirth, :date
  end
end
