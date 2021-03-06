class User < ApplicationRecord

    def display_information
        p = 'nothing'
        p = password if password != nil
        
        "Name: " + name + "password: " + p
    end
    
    
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i 
    validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false}
    before_save { self.email = email.downcase }
    #can also be written as: before_save { self.email = self.email.downcase }
    has_secure_password
    validates :password, presence: true, length: { minimum: 1 }

end
