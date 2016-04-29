class ItemsController < ApplicationController
before_action :set_item, only: [:show, :edit, :update, :destroy]
  
  def set_item
     @item = Item.find(params[:id])
  end
  
  def show # 追加
  end
  
  def show_sugar_outer
     @item = Item.find(params[:id])
     render 'show_sugar_outer'
  end
  
  def new
    @item = Item.new
  end

####################################################### 
#バズリンクソンズ
  def new_buzz_outer
    @item = Item.new
  end
  
  def new_buzz_tops
    @item = Item.new
  end
  
  def new_buzz_ragran
    @item = Item.new
  end
  
  def new_buzz_bottoms
    @item = Item.new
  end
  
  def new_buzz_other
    @item = Item.new
  end
  
#シュガーケーン
  def new_sugar_outer
    @item = Item.new
  end
  
  def made_sugar_outer
    @item = Item.find(params[:id])
    render 'show_sugar_outer'
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
  def output_OfficialPC
    @item = Item.find(params[:id])
    render 'outputs/official-pc'
  end
  def output_DeNA
    @item = Item.find(params[:id])
    render 'outputs/dena'
  end

#######################################################   
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item # ここを修正
    else
      render 'new'
    end
  end
  
  def edit 
    render 'edit'
  end
 
  
  def update
    if @item.update(item_params)
      redirect_to @item, notice: 'メッセージを編集しました'
    else
      render 'edit'
    end
  end
  
  def destroy
    @item.destroy
    redirect_to root_path, notice: 'メッセージを削除しました'
  end
  
 ############################################################
  
  def item_params
    params.require(:item).permit(:itemNumber, 
                                 :imgURL,
                                 :itemName,
                                 :itemDescription,
                                 :modelSizeA,
                                 :modelSizeB,
                                 :totalItemsNameA,
                                 :totalItemsURLA,
                                 :totalItemsNameB,
                                 :totalItemsURLB,
                                 :totalItemsNameC,
                                 :totalItemsURLC,
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
                                 :material,
                                 :madein,
                                 :process)
                                 
  end
end
