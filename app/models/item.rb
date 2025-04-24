class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee_burden
  belongs_to :prefecture
  belongs_to :shipping_day

  with_options presence: true do
    validates :image
    validates :title, length: { maximum: 40 }
    validates :content, length: { maximum: 1000 }
    validates :category_id
    validates :condition_id
    validates :shipping_fee_burden_id
    validates :prefecture_id
    validates :shipping_day_id
    validates :price
  end

  validates :category_id, :condition_id, :shipping_fee_burden_id, :prefecture_id, :shipping_day_id,
            numericality: { other_than: 1, message: 'を選択してください' }

  validates :price, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999,
    message: 'は¥300〜¥9,999,999の範囲で入力してください'
  }
end
