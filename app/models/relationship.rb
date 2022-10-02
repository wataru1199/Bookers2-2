class Relationship < ApplicationRecord
  
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User" 
  #userテーブルからuser_idを上記の名前に入れて情報を取得？
  #単にデータを反映させていることだけを明記？
end
