class Micropost < ApplicationRecord
  belongs_to :user
  has_one_attached :image # 投稿1件につき画像1件
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
