class User < ActiveRecord::Base
  
  validates :name, length: { minimum: 3, message: "Must be at least 3 characters." }
  validates :email, uniqueness: true, format: /.+@.+\..+/


	def password 
		@password ||= BCrypt::Password.new(password_hash)
	end

	def password=(new_password)
		@password = BCrypt::Password.create(new_password)
		self.password_hash = @password
	end

	def self.authenticate(username, password)
		user = self.find_by_username(username)
		return nil if user.nil?
		return user.password == password ? user : nil 
	end

end
