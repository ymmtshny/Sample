class AddLinksToItems < ActiveRecord::Migration
  def change
    add_column :items, :totalItemsNameD, :string
    add_column :items, :totalItemsURLD, :string
    add_column :items, :totalItemsNameE, :string
    add_column :items, :totalItemsURLE, :string
    add_column :items, :totalItemsNameF, :string
    add_column :items, :totalItemsURLF, :string
    add_column :items, :totalItemsNameG, :string
    add_column :items, :totalItemsURLG, :string
    add_column :items, :totalItemsNameH, :string
    add_column :items, :totalItemsURLH, :string
    add_column :items, :totalItemsNameI, :string
    add_column :items, :totalItemsURLI, :string
  end
end
