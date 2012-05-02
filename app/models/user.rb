# == Schema Information
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  email              :string(255)
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  encrypted_password :string(255)
#  facebook_id        :integer
#  bayes              :binary
#  user_type          :integer
#  remember_token     :string(255)
#  string             :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation

  attr_accessor :password, :password_confirmation

  before_save { |user| user.email = email.downcase }
  before_save :encrypt_password

  validates :name, :presence => true,
                    :length => { :maximum => 50 }
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true,
                    :format => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => { :within => 6..40 }

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  class << self
    def authenticate(email, submitted_password)
      user = find_by_email(email)
      (user && user.has_password?(submitted_password)) ? user : nil
    end
    
    def authenticate_with_remember_token(id, cookie_remember_token)
      user = find_by_id(id)
      (user && user.remember_token == cookie_remember_token) ? user : nil
    end
  end

  private

    def encrypt_password
      self.remember_token = SecureRandom.urlsafe_base64
      self.encrypted_password = encrypt(password)
    end
  
    def encrypt(string)
      secure_hash("#{remember_token}--#{string}")
    end
    
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end
