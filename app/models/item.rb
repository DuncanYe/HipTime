class Item < ApplicationRecord
  validates_presence_of :title, :description, :user_id

  belongs_to :user

  def completed?
    !completed_at.blank?
  end
end
