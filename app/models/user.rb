class User < ApplicationRecord
    has_secure_password
    validates_presence_of :email
    validates_uniqueness_of :email, case_sensitive: false
    validates_format_of :email, with: /@/
    before_save :downcase_email

    has_many :clients
    has_many :orders, through: :clients

    has_many :insta_products
    has_many :posts
    has_many :you_videos

    def downcase_email
        self.email = self.email.delete(' ').downcase
    end
end
