class Add < ActiveRecord::Migration[5.2]
  def change
    add_column :buildings, :namestock, :text, array: true
  end
end
