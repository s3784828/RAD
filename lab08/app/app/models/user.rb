class User < ApplicationRecord

    def display_information
        p = 'nothing'
        p = password if password != nil
        
        "Name: " + name
    end
    
    
    # validates :name, presence: true, length: { maximum: 50 }
    # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i 
    # validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false}
    #before_save { self.email = email.downcase }
    #can also be written as: before_save { self.email = self.email.downcase }

    #has_secure_password checks if the value is nil for new passwords
    has_secure_password
    #since has_secure_password checks if password value is nil, we can allow_nil: to be true for users,
    #to update their setting without having to input a password.
    validates :password, presence: true, length: {minimum: 1}, allow_nil: true

    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost) 
    end

end
