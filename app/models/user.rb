class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
    
    with_options length: {in: 8..32} do
        validates :password
        validates :password_confirmation
    end
    
    with_options format: {with: /\A(?=.*?[a-z])(?=.*\d)[a-z\d]{1,}\z/} do
        validates :password
        validates :password_confirmation
    end
    # validates :password, length: {in: 8..32}
    # validates :password_confirmation, length: {in: 8..32}
    # validates :password, format: {with: /\A(?=.*?[a-z])(?=.*\d)[a-z\d]{1,}\z/}
    # validates :password_confirmation, format: {with: /\A(?=.*?[a-z])(?=.*\d)[a-z\d]{1,}\z/}
    validates :email, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
    # validates :email, format: {with: /\A([^@\s]+)@([^@\s][a-z\d-]+)\.([^@\s][a-z\d-]+).[a-z]+\z/}
    validates :name, length: {maximum: 15}
    
    has_secure_password
    
    has_many :topics
    has_many :favorites
    has_many :favorite_topics, through: :favorites, source: 'topic'
    has_many :comments
end
