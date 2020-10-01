class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :payment
  belongs_to_active_hash :area
  belongs_to_active_hash :day
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :explain
    validates :category
    validates :status
    validates :payment 
    validates :area
    validates :day 
    validates :image
  end
  validates :price, presence: true, format: {
                                      with: /\A[0-9]+\z/ }

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :payment_id
    validates :area_id
    validates :day_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end

end
