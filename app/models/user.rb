class User < ApplicationRecord
    has_secure_password
    has_many :user_blog
    has_many :blogs, through: :user_blog

    validates :username, presence: true
    validates :username, uniqueness: true
end
