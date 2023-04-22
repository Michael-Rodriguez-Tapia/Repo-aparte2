class Order < ApplicationRecord
    belongs_to :user, foreign_key: 'id_user'
    belongs_to :product
    validates :id_product, presence: true
    validates :order_date, presence: true
    validates :status, presence: true

"""
colocar validate
"""
end
