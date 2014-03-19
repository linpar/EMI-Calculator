class User < ActiveRecord::Base
	#Validations
	EMAIL_REGEX = /\A([0-9a-zA-Z]([-\.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})\Z/i
	attr_accessor :password
	validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
	validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
	validates :password, :confirmation => true 
	validates_length_of :password, :in => 6..20, :on => :create

	#Encrypt Password
	before_save :encrypt_password
	after_save :clear_password
	def encrypt_password
		if password.present?
			self.salt = BCrypt::Engine.generate_salt
			self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
		end
	end
	#Clear Password after form save
	def clear_password
  	self.password = nil
	end
	def self.authenticate(username_or_email="", login_password="")
		if  EMAIL_REGEX.match(username_or_email)    
			user = User.find_by_email(username_or_email)
		else
			user = User.find_by_username(username_or_email)
		end
		if user && user.match_password(login_password)
			return user
		else
			return false
		end
	end   
	def match_password(login_password="")
		encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
	end
end
