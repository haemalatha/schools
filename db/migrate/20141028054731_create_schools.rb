class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name,        null: false
      t.string :sub_domain,  null: false
      t.string :board
      t.string :address
      t.integer :phone_no
      t.string :city
      t.string :state

      t.timestamps
    end

    add_index :schools, :name, name: 'name', unique: true
  end
end


