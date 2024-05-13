class User < ApplicationRecord
  # 論理削除設定
  include Discard::Model
  default_scope -> { kept }

  # バリデーション
  validates :uid, presence: true, uniqueness: true, length: { maximum: 255 }
  validates :member_id, uniqueness: true, length: { maximum: 9 }
  validates :last_name, presence: true, length: { maximum: 255 }
  validates :first_name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: { scope: :discarded_at }, length: { maximum: 255 }

  # 日付項目のフォーマット変換
  def f_created_at
    created_at.strftime('%Y/%m/%d %H:%M:%S')
  end

  def f_updated_at
    updated_at.strftime('%Y/%m/%d %H:%M:%S')
  end

  def f_discarded_at
    if discarded_at
      discarded_at.strftime('%Y/%m/%d %H:%M:%S')
    else
      nil
    end
  end
end