class Friendship < ApplicationRecord

  # 一筆交友紀錄屬於一個發送交友的user
  belongs_to :user
  # 一筆交友紀錄也屬於一個接受交友的user
  belongs_to :friend, class_name: "user"

end
