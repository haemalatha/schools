class AddschoolidTostandard < ActiveRecord::Migration
  def change
    add_reference :standards, :schools, index: true
  end
end
