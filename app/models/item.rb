class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :payment
  belongs_to_active_hash :area
  belongs_to_active_hash :day

  with_options presence: true do
    validates :name
    validates :explain
    validates :category
    validates :status
    validates :payment 
    validates :area
    validates :date 
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :payment_id
    validates :area_id
    validates :date_id
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

end
