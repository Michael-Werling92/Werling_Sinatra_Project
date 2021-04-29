class User < ActiveRecord::Base
    has_secure_password

    has_many :inventions

    validates :username, :name, presence: true

    validates :username, uniqueness: true
end