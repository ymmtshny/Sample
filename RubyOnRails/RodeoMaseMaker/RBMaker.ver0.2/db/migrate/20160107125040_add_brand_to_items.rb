class AddBrandToItems < ActiveRecord::Migration
  def change
    add_column :items, :brand, :reference
  end
end
