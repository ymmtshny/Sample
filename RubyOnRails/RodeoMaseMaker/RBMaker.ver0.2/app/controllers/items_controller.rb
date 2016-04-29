class ItemsController < ApplicationController
before_action :set_item, only: [:show, :edit, :update, :destroy]
  
  def set_item
     @item = Item.find(params[:id])
  end
  
  def show # 追加
  end
  
  def showall
    @item = Item.all
  end
  
  def new
    @item = Item.new
  end

  
  def create

    @item = Item.new(item_params)
    
    if @item.save
      redirect_to show_path(@item.brand_id, @item.category, @item) # ここを修正
    else
      redirect_to new_item_path(params[:brand_id], params[:category])
      flash.now[:alert] = "メッセージの保存に失敗しました。"
    end
  end
  
  def edit 
    render 'edit'
  end
 
  
  def update
    if @item.update(item_params)
      redirect_to show_path(@item.brand_id, @item.category, @item), notice: 'メッセージを編集しました'
    else
      render 'edit'
    end
  end
  
  def destroy
    @item.destroy
    redirect_to root_path, notice: 'メッセージを削除しました'
  end
  
#######################################################
#OUTPUT
  def output_rakutenPC
    @item = Item.find(params[:id])
    render 'outputs/rakuten-pc'
  end
  def output_rakutenSP
    @item = Item.find(params[:id])
    render 'outputs/rakuten-sp'
  end
  def output_rakutenMobile
    @item = Item.find(params[:id])
    render 'outputs/rakuten-mobile'
  end
  def output_YahooPC
    @item = Item.find(params[:id])
    render 'outputs/yahoo-pc'
  end
  def output_YahooSP
    @item = Item.find(params[:id])
    render 'outputs/yahoo-sp'
  end
  def output_OfficialPC
    @item = Item.find(params[:id])
    render 'outputs/official-pc'
  end
  def output_DeNA
    @item = Item.find(params[:id])
    render 'outputs/dena'
  end

####################################################### 
  
#######################################################
  
  def item_params
    params.require(:item).permit(:itemNumber, 
                                 :imgURL,
                                 :itemName,
                                 :itemDescription,
                                 :itemDetail,
                                 :modelSizeA,
                                 :modelSizeB,
                                 :totalItemsNameA,
                                 :totalItemsURLA,
                                 :totalItemsNameB,
                                 :totalItemsURLB,
                                 :totalItemsNameC,
                                 :totalItemsURLC,
                                 :totalItemsNameD,
                                 :totalItemsURLD,
                                 :totalItemsNameE,
                                 :totalItemsURLE,
                                 :totalItemsNameF,
                                 :totalItemsURLF,
                                 :totalItemsNameG,
                                 :totalItemsURLG,
                                 :totalItemsNameH,
                                 :totalItemsURLH,
                                 :totalItemsNameI,
                                 :totalItemsURLI,
                               :numberOfImages,
                               :details01,
                               :details02,
                               :details03,
                               :details04,
                               :details05,
                               :details06,
                               :details07,
                               :details08,
                               :details09,
                               :details10,
                               :details11,
                               :details12,
                               :details13,
                               :details14,
                               :details15,
                               :details16,
                               :details17,
                               :details18,
                               :details19,
                               :details20,
                               :details21,
                               :details22,
                               :details23,
                               :details24,
                                 :size00,
                                 :size01,
                                 :size02,
                                 :size03,
                                 :size04,
                                 :size05,
                                 :size06,
                                 :size07,
                                 :size10,
                                 :size11,
                                 :size12,
                                 :size13,
                                 :size14,
                                 :size15,
                                 :size16,
                                 :size17,
                                 :size20,
                                 :size21,
                                 :size22,
                                 :size23,
                                 :size24,
                                 :size25,
                                 :size26,
                                 :size27,
                                 :size30,
                                 :size31,
                                 :size32,
                                 :size33,
                                 :size34,
                                 :size35,
                                 :size36,
                                 :size37,
                                 :size40,
                                 :size41,
                                 :size42,
                                 :size43,
                                 :size44,
                                 :size45,
                                 :size46,
                                 :size47,
                                 :size50,
                                 :size51,
                                 :size52,
                                 :size53,
                                 :size54,
                                 :size55,
                                 :size56,
                                 :size57,
                                 :size60,
                                 :size61,
                                 :size62,
                                 :size63,
                                 :size64,
                                 :size65,
                                 :size66,
                                 :size67,
                                 :size70,
                                 :size71,
                                 :size72,
                                 :size73,
                                 :size74,
                                 :size75,
                                 :size76,
                                 :size77,
                                 :size80,
                                 :size81,
                                 :size82,
                                 :size83,
                                 :size84,
                                 :size85,
                                 :size86,
                                 :size87,
                                 :size90,
                                 :size91,
                                 :size92,
                                 :size93,
                                 :size94,
                                 :size95,
                                 :size96,
                                 :size97,
                                 :material,
                                 :madein,
                                 :process,
                                 :brand_id,
                                 :category
                                )
                                 
  end
end
