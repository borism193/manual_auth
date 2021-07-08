
class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
    has_many :stories, dependent: :destroy

end
