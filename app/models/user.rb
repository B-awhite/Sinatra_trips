class User < ActiveRecord::Base 
    has_many :trips 
    has_secure_password
    validates :username, :password, presence: true 
    validates_uniqueness_of :username 
end 