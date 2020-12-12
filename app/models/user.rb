class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
    validates :password, length: {in: 8..32}
    validates :password_confirmation, length: {in: 8..32}
    validates :password, format: {with: /\A(?=.*?[a-z])(?=.*\d)[a-z\d]{1,}\z/}
    validates :password_confirmation, format: {with: /\A(?=.*?[a-z])(?=.*\d)[a-z\d]{1,}\z/}
    validates :email, format: {with: /\A([^@\s]+)@([^@\s][a-z\d-])+(.[^@\s][a-z\d-]+)*.[a-z]+\z/}
    validates :name, length: {maximum: 15}
    
    has_secure_password
end
