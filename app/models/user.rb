class User < ApplicationRecord
    has_secure_password
    validates :email, uniqueness: { case_sensitive: false }

    has_many :clients
    has_many :orders, through: :clients

    has_many :insta_products
    has_many :posts
    has_many :you_videos
end
