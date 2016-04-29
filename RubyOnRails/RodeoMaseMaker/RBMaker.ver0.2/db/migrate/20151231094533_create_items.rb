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
      
      t.string :size20 
      t.string :size21 
      t.string :size22 
      t.string :size23 
      t.string :size24 
      t.string :size25 
      t.string :size26 
      t.string :size27 
  
      t.string :size30 
      t.string :size31 
      t.string :size32 
      t.string :size33 
      t.string :size34 
      t.string :size35 
      t.string :size36 
      t.string :size37
      
      t.string :size40 
      t.string :size41 
      t.string :size42 
      t.string :size43 
      t.string :size44 
      t.string :size45 
      t.string :size46 
      t.string :size47 
      
      t.string :size50 
      t.string :size51 
      t.string :size52 
      t.string :size53 
      t.string :size54 
      t.string :size55 
      t.string :size56 
      t.string :size57 
      
      t.string :size60 
      t.string :size61 
      t.string :size62 
      t.string :size63 
      t.string :size64 
      t.string :size65 
      t.string :size66 
      t.string :size67 
      
      t.string :size70 
      t.string :size71 
      t.string :size72 
      t.string :size73 
      t.string :size74 
      t.string :size75 
      t.string :size76 
      t.string :size77 
      
      t.string :size80 
      t.string :size81 
      t.string :size82 
      t.string :size83 
      t.string :size84 
      t.string :size85 
      t.string :size86 
      t.string :size87
      
      t.string :size90 
      t.string :size91 
      t.string :size92 
      t.string :size93 
      t.string :size94 
      t.string :size95 
      t.string :size96 
      t.string :size97
      
      t.text :material 
      t.string :madein 
      t.text :process 

      t.timestamps null: false
    end
  end
end
