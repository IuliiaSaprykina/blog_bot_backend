class Blog < ApplicationRecord
    has_many :user_blog
    has_many :users, through: :user_blog

end
