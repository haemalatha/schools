class AddstandardidTosection < ActiveRecord::Migration
  def change
    add_reference :sections, :standards, index: true
  end
end
