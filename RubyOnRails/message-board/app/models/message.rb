class Message < ActiveRecord::Base
    #名前入力は必須かつ２０文字以内
    validates :name , length: { maximum: 20 }, presence: true
    #入力内容は２〜３０文字
    validates :body , length: { minmum: 2 , maximum:30 }, presence: true
end
