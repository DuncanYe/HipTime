class Item < ApplicationRecord
  validates_presence_of :title, :description, :user_id

  belongs_to :user

  def completed?
    completed_at.present?
    # !completed_at.blnck?
    # 沒驚嘆號代表是空的話就顯示ture
    # 加驚嘆號代表不是空的話(裡面有東西)就顯示ture
  end
end
