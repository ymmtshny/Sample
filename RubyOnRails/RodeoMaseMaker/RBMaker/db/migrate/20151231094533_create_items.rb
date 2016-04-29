class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :itemNumber
      t.string :imgURL
      t.string :itemName
      t.text :itemDescription
      t.text :itemDetail
      t.string :modelSizeA 
      t.string :modelSizeB 
      t.string :totalItemsNameA
      t.string :totalItemsURLA 
      t.string :totalItemsNameB 
      t.string :totalItemsURLB 
      t.string :totalItemsNameC 
      t.string :totalItemsURLC 
      
      #配列にしたい。
      t.string :size00 
      t.string :size01 
      t.string :size02 
      t.string :size03 
      t.string :size04 
      t.string :size05 
      t.string :size06 
      t.string :size07 
      
      t.string :size10 
      t.string :size11 
      t.string :size12 
      t.string :size13 
      t.string :size14 
      t.string :size15 
      t.string :size16 
      t.string :size17 
      
      t.text :material 
      t.string :madein 
      t.text :process 

      t.timestamps null: false
    end
  end
end
