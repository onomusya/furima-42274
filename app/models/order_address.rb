class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building,
                :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'は「3桁ハイフン4桁」の形式で入力してください' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は10〜11桁の半角数字で入力してください' }
    validates :user_id
    validates :item_id
    validates :token

    def save
      order = Order.create(user_id: user_id, item_id: item_id)
      
      ShippingAddress.create(
        postal_code:   postal_code,
        prefecture_id: prefecture_id,
        city:          city,
        house_number:  house_number,
        building:      building,
        phone_number:  phone_number,
        order_id:      order.id
      )
    end
  end