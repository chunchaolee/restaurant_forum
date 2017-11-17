class Restaurant < ApplicationRecord
  # 建立表單驗證
  validates_presence_of :name

end
