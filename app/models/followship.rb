class Followship < ApplicationRecord
  # 一筆追蹤紀錄，屬於發出追蹤的user
  belongs_to :user
  # 一筆追蹤紀錄，也屬於被追蹤的使用者
  belongs_to :following, class_name: "User"
end
