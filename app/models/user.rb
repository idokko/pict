class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
    validates :password, length: {in: 8..32}
    validates :password, format: {with: /\A[a-zA-Z]+\z/, minimum: 1}
    validates :password, format: {with: /\A[0-9０-９]\z/, minimum: 1}
    validates :email, format: {with: /\A[\w+-.]+@[a-z\d.]+.[a-z]+\z/}
    validates :name, length: {maximum: 15}
    
    
    has_secure_password
end
